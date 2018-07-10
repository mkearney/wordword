
#' Synonyms of a given word
#'
#' Returns synonyms for a given word using the words API from bighugelabs
#'
#' @param word Word from which synonyms should be found.
#' @param key User API key as assigned from bighugelabs. The default, NULL,
#'   looks for a \code{BIGHUGELABS_KEY} environment variable, which it sets
#'   automatically for you after specifying the key once per machine.
#' @return A list of synonyms for the word across different parts of speech
#'   (if applicable)
#' @export
sameword <- function(word, key = NULL) UseMethod("sameword")

#' @export
sameword.words <- function(word, key = NULL) {
  purrr::map(unlist(word), sameword)
}

#' @export
sameword.default <- function(word, key = NULL) {
  has_pat <- !identical(Sys.getenv("BIGHUGELABS_KEY"), "")
  if (is.null(key) && !has_pat) {
    stop("couldn't find `BIGHUGELABS_KEY` environment variable.")
  }
  if (is.null(key)) {
    key <- Sys.getenv("BIGHUGELABS_KEY")
  } else {
    stopifnot(length(key) == 1, is.character(key))
    set_renv(BIGHUGELABS_KEY = key)
  }
  stopifnot(length(key) == 1, is.character(key))
  stopifnot(length(word) == 1, is.character(word))
  x <- jsonlite::fromJSON(httr::content(httr::GET(sprintf(
    "http://words.bighugelabs.com/api/2/%s/%s/json", key, word)),
    as = "text", encoding = "UTF-8"))
  for (i in seq_along(x)) {
    x[[i]]$ant <- NULL
    if (length(x[[i]]) == 0) next
    x[[i]] <- unlist(x[[i]], use.names = FALSE)
  }
  structure(list(x),
    names = word,
    class = c("words", "list"),
    lexical = "synonym")
}


#' Antonyms of a given word
#'
#' Returns antonyms for a given word using the words API from bighugelabs
#'
#' @param word Word from which antonyms should be found.
#' @param key User API key as assigned from bighugelabs. The default, NULL,
#'   looks for a \code{BIGHUGELABS_KEY} environment variable, which it sets
#'   automatically for you after specifying the key once per machine.
#' @return A list of antonyms for the word across different parts of speech
#'   (if applicable)
#' @export
diffword <- function(word, key = NULL) UseMethod("diffword")

#' @export
diffword.words <- function(word, key = NULL) {
  purrr::map(unique(unlist(word)), diffword)
}

#' @export
diffword.default <- function(word, key = NULL) {
  has_pat <- !identical(Sys.getenv("BIGHUGELABS_KEY"), "")
  if (is.null(key) && !has_pat) {
    stop("couldn't find `BIGHUGELABS_KEY` environment variable.")
  }
  if (is.null(key)) {
    key <- Sys.getenv("BIGHUGELABS_KEY")
  } else {
    stopifnot(length(key) == 1, is.character(key))
    set_renv(BIGHUGELABS_KEY = key)
  }
  stopifnot(length(key) == 1, is.character(key))
  stopifnot(length(word) == 1, is.character(word))
  r <- httr::GET(sprintf(
    "http://words.bighugelabs.com/api/2/%s/%s/json", key, word))
  if (r$status_code == 500) {
    cat_line("Something didn't work. One of the following is probably true:\n",
      "  - Usage Exceeded: Usage limits have been exceeded\n",
      "  - Inactive key: The key is not active\n",
      "  - Missing words: No word was submitted\n",
      "  - Not whitelisted: The IP address was blocked")
  }
  httr::stop_for_status(r)
  r <- httr::content(r, as = "text", encoding = "UTF-8")
  x <- jsonlite::fromJSON(r)
  for (i in seq_along(x)) {
    x[[i]]$sim <- NULL
    x[[i]]$syn <- NULL
    x[[i]]$rel <- NULL
    if (length(x[[i]]) == 0) next
    x[[i]] <- unlist(x[[i]], use.names = FALSE)
  }
  structure(list(x),
    names = word,
    class = c("words", "list"),
    lexical = "antonym")
}


from_json <- function(x) {
  x <- tryCatch(jsonlite::fromJSON(httr::content(x, as = "text", encoding = "UTF-8"),
    flatten = TRUE), error = function(e) return(NULL))
}


#' @importFrom rlang .data
to_df <- function(x) {
  if (!is.null(x)) {
    x <- tryCatch({
      main <- tibble::as_tibble(x$data[!names(x$data) %in% c("synonyms", "antonyms")])
      main <- dplyr::select(main, id = `_id`, entry = entry, target_term = targetTerm, definition)
      for (i in seq_along(x$data$synonyms)) {
        if (nrow(x$data$synonyms[[i]]) > 0) {
          x$data$synonyms[[i]]$id <- main$id[i]
        }
      }
      for (i in seq_along(x$data$antonyms)) {
        if (nrow(x$data$antonyms[[i]]) > 0) {
          x$data$antonyms[[i]]$id <- main$id[i]
        }
      }

      rels <- tibble::as_tibble(dplyr::bind_rows(
        dplyr::bind_rows(x$data$synonyms),
        dplyr::bind_rows(x$data$antonyms)))

      rels <- dplyr::select(rels, id, term, similarity, is_informal = isInformal, is_vulgar = isVulgar) %>%
        dplyr::mutate_if(c(FALSE, FALSE, rep(TRUE, 3)), as.double) %>%
        dplyr::mutate(is_informal = .data$is_informal == 0,
          is_vulgar = .data$is_vulgar == 1 & !is.na(.data$is_vulgar))

      dplyr::full_join(main, rels, by = "id")
    }, error = function(e) return(x))
  }
  x
}

#' Access the unofficial API of thesaurus.com
#'
#' This returns the results from the thesaurus.com engine (tuna.thesaurus.com).
#'
#' @param word The word of interest.
#'
#' @return A data frame with words, definitions, similiarity indices, etc.
#' @export
tuna <- function(word) {
  x <- httr::GET(sprintf("https://tuna.thesaurus.com/relatedWords/%s", word))
  httr::warn_for_status(x)
  x <- from_json(x)
  to_df(x)
}

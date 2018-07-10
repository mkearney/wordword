
#' @export
print.words <- function(x) {
  lexical_type <- attr(x, "lexical")
  attr(x, "lexical") <- NULL
  if (lexical_type == "synonym") {
    lex <- crayon::make_style("#00aa00")("Synonyms")
  } else {
    lex <- crayon::make_style("#dd2222")("Antonyms")
  }
  cat_line(lex, " of \"", names(x), "\":")
  cat(" ")
  x <- x[[1]]
  NextMethod()
}

cat_line <- function(...) cat(paste0(..., "\n"), sep = "")

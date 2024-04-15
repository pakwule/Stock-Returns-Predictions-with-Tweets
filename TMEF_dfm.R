# The documentation of this function is standard in R... For the package "roxygen2"
# If you put this in a package, the formatting will be automatically converted to a help file
# That way you can see this documentation simply by typing ?TMEF_dfm at any time

#' A simple dfm function for text mining
#' @description Builds a document feature matrix from a corpus of documents
#' @param text character vector This should contain a corpus of documents
#' @param ngrams numeric what length of phrase should we use? Default is 1
#' @param stop.words logical Should stop words be deleted? Default is TRUE
#' @param custom_stop_words 
#' @param min.prop numeric threshold for including rare words. Default is .01 (i.e. at least 1% of documents)
#' @details We built this in class. It requires textclean and quanteda to run
#' @return A document feature matrix
#'
#' @import magrittr
#' @import quanteda
#' @import textclean
#' @export
TMEF_dfm<- function(text,
            ngrams = 1,
            stop.words = TRUE,
            custom_stop_words = NULL,
            min.prop = 0.01) {
  
  if (!is.character(text)) {  
    stop("Must input character vector")
  }
  
  drop_list <- ""
  
  if(stop.words) drop_list=stopwords("en") 
  
  if (!is.null(custom_stop_words)) {
    drop_list <- c(drop_list, custom_stop_words)
  }
  text_data <- text %>%
    replace_contraction() %>%
    tokens(remove_numbers = TRUE,
           remove_punct = TRUE) %>%
    tokens_wordstem() %>%
    tokens_select(pattern = drop_list, 
                  selection = "remove") %>%
    dfm() %>%
    dfm_trim(min_docfreq = min.prop, docfreq_type = "prop")
  
  return(text_data)
}

## Kendall Accuracy
kendall_acc<-function(x,y,percentage=TRUE){
  kt=cor(x,y,method="kendall")
  kt.acc=.5+kt/2
  kt.se=sqrt((kt.acc*(1-kt.acc))/length(x))
  report=data.frame(acc=kt.acc,
                    lower=kt.acc-1.96*kt.se,
                    upper=kt.acc+1.96*kt.se)
  report = round(report,4)
  if(percentage) report = report*100
  return(report)
}

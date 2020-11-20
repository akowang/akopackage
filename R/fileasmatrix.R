#' File as matrix
#'
#' This function takes in a file and convert it into a matrix.The rows with duplicated row names will be dropped.
#'
#' @param infile
#' @return Returns to the matrix of the data
#' @export
fileasmatrix <- function(infile){
  in.dt <- data.table::fread(infile, header = TRUE)
  in.dt <- in.dt[!duplicated(in.dt[, 1]), ]
  in.mat <- as.matrix(in.dt[, -1, with = FALSE])
  rownames(in.mat) <- unlist(in.dt[, 1, with = FALSE])
  in.mat
}



#' Title: Read in one nurses' stress data file
#'
#' @param file_path A path to a data file
#' @param max_rows Setting a max of numbers of rows
#'
#' @returns Outputs a data frame/tibble
#'
read <- function(file_path, max_rows = 100) {
  data <- file_path |>
    readr::read_csv(
      show_col_types = FALSE,
      name_repair = snakecase::to_snake_case,
      n_max = max_rows
    )
  base::return(data)
}

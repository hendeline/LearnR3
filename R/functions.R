
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


#Anden funktion fra exercise 18.5
#' Title: Read all `.csv.gz` files in the `stress/` folder into one data frame.
#'
#' @param filename The name of files in the sub-folders that we want to read in.
#'
#' @returns A single data frame/tibble.

read_all <- function(filename) {
  files <- here::here("data-raw/nurses-stress/") %>%
    fs::dir_ls(regexp = "HR.csv.gz", recurse = TRUE)

  data <- files %>%
    purrr::map(read) %>%
    purrr::list_rbind(names_to = "file_path_id")
  return(data)
}

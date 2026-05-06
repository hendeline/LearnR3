
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


#Anden funktion fra øvelse 19.7:
#' Title: Get the participant ID from the file path column.
#'
#' @param data Data with `file_path_id` column.
#'
#' @returns A data frame/tibble.

get_participant_id <- function(data){
  data_with_id <- data %>%
    dplyr::mutate(
      id = stringr::str_extract(
        file_path_id,
        pattern = "/stress/[:alnum:]{2}/"
      ) %>%
        stringr::str_remove("/stress/") %>%
        stringr::str_remove("/")
      ,
      .before = file_path_id
    ) %>%
    dplyr::select(-file_path_id)
  return(data_with_id)
}


#Funktion fra øvelse 20.6:
#' Title: Summarise values in a data frame by a rounded datetime
#'
#' @param data A data frame with at least a `collection_datetime` column and
#'  some numeric columns to summarise.
#'
#' @returns A summarised data frame.
#'
summarise_by_datetime <- function(data) {
  summarised_data <- data |>
    dplyr::mutate(
      collection_datetime = lubridate::round_date(
        collection_datetime,
        unit = "minute"
      )
    ) %>%
    dplyr::summarise(
      dplyr::across(
        tidyselect::where(is.numeric),
        base::list(mean = mean, sd = sd, median = median)
      ),
      .by = c(id, collection_datetime)
    )
  base::return(summarised_data)
}

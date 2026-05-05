


library(here)
# The dataset can be downloaded manually from
# <https://drive.proton.me/urls/ZHZ6TCAN2W#e5D5U4IajdYp>.
# Make sure to save this file to the `data-raw/` folder with the name
# `nurses-stress.tar`.

usethis::use_git_ignore("data-raw/nurses-stress.tar")

untar(
  here("data-raw/nurses-stress.tar"),
  exdir = here("data-raw/nurses-stress/")
)

fs::dir_tree("data-raw/", recurse = 2)

usethis::use_git_ignore("data-raw/nurses-stress/")

#Har commited og pushed

r3::check_project_setup_intermediate()


#Indsætter code fra pre-task (tror bare at det er ovenstående samlet i en lang kode):

usethis::use_data_raw("nurses-stress")
library(here)
# To print the file list.
fs::dir_tree("~/Desktop/LearnR3", recurse = 1)
# The dataset can be downloaded manually from
# <https://drive.proton.me/urls/ZHZ6TCAN2W#e5D5U4IajdYp>.
# Make sure to save this file to the `data-raw/` folder with the name
# `nurses-stress.tar`.
usethis::use_git_ignore("data-raw/nurses-stress.tar")
untar(
  here("data-raw/nurses-stress.tar"),
  exdir = here("data-raw/nurses-stress/")
)
fs::dir_tree("data-raw/", recurse = 2)
usethis::use_git_ignore("data-raw/nurses-stress/")
gert::git_add(".")
gert::git_commit("Download nurses stress data and save to data-raw/")
gert::git_push()
r3::check_project_setup_intermediate()

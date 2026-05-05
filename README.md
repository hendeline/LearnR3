#Gør følgende som beskrevet i pre-course-opgave:
usethis::use_r("functions", open = FALSE)

#Laver to nye filer (Quarto)
r3::create_learning_qmd()
r3::create_cleaning_qmd()

#Token git:
usethis::gh_token_help()
#Ser at jeg har en token i github. Kan ellers opdatere (når jeg får ny, når den tidligere udløber)med: gitcreds::gitcreds_set()

#Ignore the auto-generated Quarto files:
usethis::use_git_ignore(c("*.html", "*_files"))

#Har commited ændringer til Git med "Setting up the project"
#Skal nu connecte til Github:
usethis::use_github()

#Henter datasæt:
usethis::use_data_raw("nurses-stress")




TODO: Add more to the title of your project here

# LearnR3:

TODO: Give a brief description of what your project is about

This project...

# Brief description of folder and file contents

TODO: As project evolves, add brief description of what is inside the
data, docs and R folders.

The following folders contain:

-   `data/`:
-   `docs/`:
-   `R/`:

# Installing project R package dependencies

If dependencies have been managed by using
`usethis::use_package("packagename")` through the `DESCRIPTION` file,
installing dependencies is as easy as opening the
`LearnR3.Rproj` file and running this command in the console:

```         
# install.packages("pak")
pak::pak()
```

You'll need to have remotes installed for this to work.

# Resource

For more information on this folder and file workflow and setup, check
out the [prodigenr](https://rostools.github.io/prodigenr) online
documentation.

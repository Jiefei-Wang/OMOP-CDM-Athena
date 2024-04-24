library(arrow)
library(readr)
## process raw csv file to feather format
path_in <- 'athena_raw'
path_out <- 'athena_feather'

files <- list.files(path_in, pattern = "\\.csv$")
files_no_ext <- tolower(gsub("\\.csv$", "", files))
files_full <- list.files(path_in, full.names = TRUE,pattern = "\\.csv$")

## read the files
for (i in seq_along(files)){
    message(i)
    df <- readr::read_tsv(files_full[i])
    ## save to feather
    write_feather(
        df, 
        file.path(path_out, paste0(files_no_ext[i], ".feather"))
    )
}




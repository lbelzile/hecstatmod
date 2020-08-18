## code to prepare `DATASET` dataset goes here

library(dplyr)
library(haven)
library(fs)
library(usethis)

setwd("/home/lbelzile/Documents/Dropbox/Teaching/2020W/MATH60619A/Données/Anglais")
lfile <- list.files(pattern = ".sas7bdat")
external_env <- new.env()
for(file in lfile){
  filen <- sub('\\.sas7bdat$', '', file)
  data <- haven::read_sas(file)
  class(data) <- "data.frame"
  for(col in colnames(data)){
    attr(data[,deparse(as.name(col))],"format.sas") <- NULL
  }
  attr(data,"label") <- NULL
  data <- tibble::as_tibble(data)
  data <- data %>% mutate(across(where(is.character), factor))
  if(filen == "crash"){
    data  <-  data  %>%
      mutate(year = factor(year),
        region = factor(region))
  } else if(filen == "renfe"){
    data <- data %>%
      mutate(dest = factor(recode(dest, "0" = "Barcelona-Madrid",
                                  "1" = "Madrid-Barcelona")),
            wday = factor(wday))
  } else if(filen == "auto"){
    data <- data %>%
      mutate(cylinders = factor(cylinders))
  } else if(filen == "tickets"){
    data <- data %>%
      mutate(group = factor(group))
  } else if(filen == "bixiuni"){
    data <- data %>%
    mutate(date = lubridate::ymd(as.character(date)))
  } else if(filen == "helmet"){
    data <- data %>%
      mutate(design = factor(design),
             impact = factor(impact))
  } else if(filen == "consumption"){
  data <- data %>%
      mutate(habit = factor(habit),
             brand = factor(brand))
  } else if(filen == "delay"){
    data <- data %>%
      mutate(delay = factor(delay),
             stage = factor(stage))
  } else if(filen == "ceb"){
    data <- data %>%
      mutate(dur = factor(dur),
             res = factor(res),
             educ = factor(educ))
  } else if(filen == "goldstein"){
      data <- data %>%
        rename(vr = VR, lrt = LRT) %>%
        mutate(school = factor(school),
               vr = factor(vr))
  } else if(filen == "gsce"){
    data <- data %>%
      mutate(center = factor(center),
             id = as.integer(id))
  } else if(filen == "intention"){
    data <- data %>%
      mutate(revenue = factor(revenue),
             educ = factor(educ),
             nitem = as.integer(nitem))
  } else if(filen == "motivation"){
    data <- data %>%
      mutate(idunit = factor(idunit),
             idemployee = as.integer(idemployee),
             nunit = as.integer(nunit))
  } else if(filen == "awards"){
    data <- data %>%
      mutate(prog = factor(prog))
  } else if(filen == "gbdriving"){
      levels(data$sex) <- c("man","woman")
  } else if(filen == "renergie"){
    data <- data %>%
      mutate(region = factor(region),
             date = lubridate::ymd(date))
  } else if(filen == "profsalary"){
    data <- data %>%
      mutate(rank = factor(rank))
  } else if(filen == "servqual"){
    data <- data %>%
      mutate(bank = factor(bank))
  } else if(filen == "tolerance"){
    data <- data %>%
      mutate(id = factor(id))
 } else if(filen == "revenge"){
  data <- data %>%
    rename(time=t) %>%
    mutate(id = factor(id),
           time = factor(time))
 }
  attributes(data)$label <- NULL
  attributes(data)$rownames <- NULL
  assign(x = filen, value = data, envir = external_env)
}
rm(data, filen)
external_env$bixicoll <- external_env$bixi
external_env$bixi <- external_env$bixiuni
external_env$bixiuni <- NULL
external_env$college <- external_env$profsalaries
external_env$profsalaries <- NULL
rm(covid, envir = external_env)


ls(external_env)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
path <- usethis::proj_get()
dir_data <- path(path, "data")
dir_create(dir_data)
objs <- ls(envir = external_env)
paths <- path(dir_data, objs, ext = "rda")
mapply(
  save,
  list = objs,
  file = paths,
  MoreArgs = list(envir = external_env, compress = "bzip2", version = 3)
)



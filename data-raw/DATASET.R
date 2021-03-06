## code to prepare `DATASET` dataset goes here

library(dplyr)
library(haven)
library(fs)
library(usethis)

setwd(paste0(dirname(dirname(dirname(dirname(rstudioapi::getActiveDocumentContext()$path)))),"/Données/SAS/Anglais/"))
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
  } else if(filen == "bixi"){
    data <- data %>%
    mutate(date = lubridate::ymd(as.character(date)))
   } else if(filen == "sweden"){
      data <- data %>%
        mutate(year = factor(year),
               day = factor(day))
  } else if(filen == "birthwgt"){
    data <- data %>%
      mutate(race = factor(race),
             smoker = factor(smoker),
             premature = factor(premature),
             hypertension = factor(hypertension),
             irrit = factor(irrit)
             )
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
 } else if(filen == "chimp"){
   data <- data %>%
     mutate(chimp = factor(chimp),
            word = factor(word))
 } else if(filen == "soccer"){
   data <- data %>%
     mutate(opponent = factor(opponent),
            team = factor(team))
 } else if(filen == "socceragg"){
   data <- data %>%
     mutate(home = factor(home),
            away = factor(away))
 } else if(filen == "buchanan"){
   data <- data %>%
     mutate(county = factor(county))
 } else if(filen == "fev1"){
   data <- data %>% rename(id=ID,
                           height=HT,
                           age=AGE,
                           baseheight=BASEHT,
                           baseage=BASEAGE,
                           logfev1=LOGFEV1) %>%
     mutate(id = factor(id))
  } else if(filen == "chicken"){
 data <- data %>%
   mutate(chick = factor(chick),
          diet = factor(diet))
  } else if(filen == "beattheblues"){
   data$id <- factor(1:nrow(data))
  # tidyr::pivot_longer(data, cols = c("bdi0","bdi2","bdi4","bdi6","bdi8"), names_to = "bdi",names_prefix = "bdi")
 } else if(filen == "dental"){
   data <- data %>% rename(id=ID,
                           gender=GENDER,
                           dist8=Y1,
                           dist10=Y2,
                           dist12=Y3,
                           dist14=Y4) %>%
     mutate(id = factor(id))
   levels(data$gender) <- c("female","male")
  } else if(filen == "pigweight"){
    data <- data %>% mutate(id = factor(id))
  } else if(filen == "rat"){
    data <- data %>% rename(id=ID,
                            group=GROUP,
                            wgt1=Y1,
                            wgt2=Y2,
                            wgt3=Y3,
                            wgt4=Y4,
                            wgt5=Y5) %>%
      mutate(id = factor(id),
             group = factor(group))
 } else if(filen == "breastfeeding"){
   data <- data %>% mutate(race = factor(race))
 } else if(filen == "shoes"){
   data <-  data %>% mutate(status = factor(status),
                            gender = factor(gender))
 }
  attributes(data)$label <- NULL
  attributes(data)$rownames <- NULL
  assign(x = filen, value = data, envir = external_env)
}
rm(data, filen)
# external_env$bixicol <- external_env$bixi
# external_env$bixi <- external_env$bixiuni
# external_env$bixiuni <- NULL
# external_env$college <- external_env$profsalaries
# external_env$profsalaries <- NULL


ls(external_env)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
path <- dirname(getwd())
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



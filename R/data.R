#' @import ggplot2 poorman viridis learnr
NULL

#' Renfe train tickets
#'
#' A subset of a larger database containing information about train tickets sold by Renfe between Madrid and Barcelona.
#' There are three types of trains: either Spanish high speed trains Alta Velocidad Española (\code{AVE}), or
#' \code{AVE-TGV} which are run in partnership with SNCF to and from France (via Toulouse), or regional trains \code{REXPRESS};
#' only the first two labelled \code{AVE} and \code{AVE-TGV} are high speed trains.
#'
#' @format a data frame of 10k observations containing the following variables:
#' \describe{
#'   \item{price}{price of ticket (in euros)}
#'   \item{dest}{factor, binary indicator for destination (Barcelona-Madrid or Madrid-Barcelona)}
#'   \item{fare}{factor, categorical variable for ticket fare; one of \code{AdultoIda}, \code{Promo} or \code{Flexible}}
#'   \item{class}{factor, categorical variable for ticket class; one of \code{Preferente}, \code{Turista}, \code{TuristaPlus} or \code{TuristaSolo}}
#'   \item{type}{factor, categorical variable for train type; either \code{AVE-TGV}, \code{AVE} or \code{REXPRESS}.}
#'   \item{duration}{advertised duration of journey (in minutes)}
#'   \item{wday}{factor integer denoting week day of travel starting from Sunday(\code{1}) to Saturday (\code{7})}
#' }
#' @source Kaggle \url{https://www.kaggle.com/thegurusteam/spanish-high-speed-rail-system-ticket-pricing}
"renfe"

#' Health insurance premium
#'
#' The simulated \code{insurance} data contain information about medical charges billed to 1338 Americans during 2003.
#'
#' @format a data frame of 1338 observations containing the following variables:
#' \describe{
#'   \item{age}{age (in years)}
#'   \item{sex}{sex of individual, \code{male} or \code{female}}
#'   \item{bmi}{body mass index (in kg/ sq.meter)}
#'   \item{children}{number of dependent children}
#'   \item{smoker}{logical, \code{yes} if the person is a smoker and \code{no} otherwise}
#'   \item{region}{categorical variable, the geographical location within the USA, one of \code{southwest}, \code{southeast}, \code{northwest} or \code{northeast}}
#'   \item{charges}{individual medical costs billed by health insurance (in USD).}
#' }
#'
#' @source Lantz, Brett (2003), \emph{Machine Learning with R}, Packt Publishing.
"insurance"

#' Car crash on US roads
#'
#' The National Highway Traffic Safety Administration (NHTSA) compiles
#' statistics about road traffic deaths in the Fatality Analysis Reporting
#' System. The yearly mortality counts for 2010 and 2018 are given in
#' crash according to whether the accident occured during daytime or
#' nighttime, and according to the NHTSA-defined geographic area.
#'
#' @source \emph{National Highway Traffic Safety Administration} (NHTSA)
#' @format A data frame of 40 observations (long format) containing the following five variables:
#' \describe{
#' \item{year}{factor giving the reference year, either \code{2010} or \code{2018}}
#' \item{region}{factor for the geographic regions defined by NHTSA}
#' \item{popn}{integer, total estimated population of the region based on census data}
#' \item{time}{factor indicating the time of the accident, \code{day} or \code{night}}
#' \item{ndeath}{integer, the number of death in car accidents}
#' }
#'
"crash"


#' Political affiliation of Americans
#'
#' Data drawn from the 2000 \emph{General Social Survey} containing sex and
#' political affiliation of surveyed individuals,
#' according to the party they identify the most with
#'
#' @format a data frame containing the 2 by 3 contingency table
#' \describe{
#' \item{count}{total counts in sample}
#' \item{gender}{gender, either \code{male} or \code{female}}
#' \item{party}{factor for party, either Democratic Party (\code{democrat}), independent (\code{indep}) or GOP (\code{republican})}
#' }
#'
#' @source Table 2.5 in Agresti (2007), An Introduction to Categorical Data Analysis, Wiley.
"affpol"

#' Practical driving exam results
#'
#' These records were extracted from GovUK and cleaned: they give the success rate
#' of practical driving license exams in the United Kingdom in 2018 in 346 driving centers.
#' A total of 761 750 people passed the test, out of 1 663 897 trials
#'
#' @format a data frame in long format containing the following variables, grouped by center
#' \describe{
#'  \item{pass}{number of successfull candidates (by sex)}
#'  \item{total}{total number of trials within the center (by sex)}
#'  \item{region}{factor indicating where the exam took place, either Scotland, Wales or one the nine regions of England}
#'  \item{sex}{factor, either \code{man} or \code{woman}}
#'  }
#' @source \url{https://www.gov.uk/government/statistical-data-sets/driving-test-statistics-drt}
"gbdriving"

#' Texting while walking
#'
#' Fake paired samples. The study undertaken at Tech3Lab
#' compared the reaction time (in seconds) of participants who had to
#' walk while texting or talking on their cell phone.
#' An EEG was used to record the reaction time before the candidate detected a bike
#' Both scenarios were randomized.
#'
#' @format a data frame of 35 observations containing the following variables
#' \describe{
#' \item{c}{reaction time (in seconds) during a call}
#' \item{t}{reaction time (in seconds) while texting}
#' }
#' @source Marc Fredette
"distraction"


#' Simulation study with Renfe data
#'
#' These are the results for a simulation study drawing sub-samples from the \code{renfe}
#' data, including test statistics, p-values and mean difference between samples
#' based on 1000 subsamples of size 100 drawn from the database.
#' Renfe.
#'
#' @format a data frame of 1000 observations containing the following variables
#' \describe{
#' \item{meandif}{mean price difference for tickets between Madrid-Barcelona versus Barcelone-Madrid}
#' \item{Wstat}{Welch statistic for the two-sample t-test}
#' \item{cilb}{lower bound of confidence interval based on Welch statistic}
#' \item{ciub}{upper bound of confidence interval based on Welch statistc}
#' \item{pval}{p-value based on asymptotic distribution}
#' }
#' @source Léo Belzile
"renfe_simu"

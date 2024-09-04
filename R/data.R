#' @import ggplot2 poorman viridis learnr
NULL

#' Renfe train tickets
#'
#' A subset of a larger database containing information about train tickets sold by Renfe between Madrid and Barcelona.
#' There are three types of trains: either Spanish high speed trains Alta Velocidad Española (\code{AVE}), or
#' \code{AVE-TGV} which are run in partnership with SNCF to and from France (via Toulouse), or regional trains \code{REXPRESS};
#' only the first two labelled \code{AVE} and \code{AVE-TGV} are high speed trains.
#' @docType data
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
#' @docType data
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
#' @docType data
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
#' @docType data
#' @format a data frame containing the 2 by 3 contingency table
#' \describe{
#' \item{count}{total counts in sample}
#' \item{gender}{gender, either \code{male} or \code{female}}
#' \item{party}{factor for party, either Democratic Party (\code{democrat}), independent (\code{indep}) or GOP (\code{republican})}
#' }
#'
#' @source Table 2.5 in Agresti (2007), An Introduction to Categorical Data Analysis, Wiley.
"polaff"

#' Practical driving exam results
#'
#' These records were extracted from GovUK and cleaned: they give the success rate
#' of practical driving license exams in the United Kingdom in 2018 in 346 driving centers.
#' A total of 761 750 people passed the test, out of 1 663 897 trials
#'
#' @docType data
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
#' @docType data
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
#' @docType data
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

#' College gender inequality study
#'
#' The 2008-09 nine-month academic salary for Assistant Professors,
#' Associate Professors and Professors in a college in the U.S.
#' The data were collected as part of the on-going effort of the college's administration
#' to monitor salary differences between male and female faculty members.
#'
#' @docType data
#' @format a data frame with 397 observations of the following variables
#' \describe{
#' \item{\code{rank}}{academic rank of the professor (\code{assistant}, \code{associate} or \code{full}).}
#' \item{\code{field}}{categorical variable indicating whether research field is \code{applied} or \code{theoretical}.}
#' \item{\code{years}}{number of years since PhD}
#' \item{\code{sex}}{binary indicator, zero for men (\code{man}) and unity for women (\code{woman}).}
#' \item{\code{service}}{number of years of service in the college.}
#' \item{\code{salary}}{nine-month income (in thousand USD).}
#' }
#'
#' @source Fox J. and Weisberg, S. (2019) \emph{An R Companion to Applied Regression}, Third Edition, Sage.
#' @seealso \link[carData]{Salaries}
"college"


#' Bixi rentals at Edouard-Montpetit
#'
#' This dataset gives the total numbers of daily rentals of Bixi bikes at the
#' Édouard-Montpetit station located in front of HEC. Some meteorological variables
#' (temperature, relative humidity) are also provided.
#'
#' @docType data
#' @format a data frame of 500 observations of the following variables
#' \describe{
#' \item{\code{nusers}}{number of daily rentals (users)}
#' \item{\code{date}}{date of count}
#' \item{\code{temp}}{temperature at the nearby airport (in Celcius)}
#' \item{\code{relhumid}}{relative humidity (in percentage)}
#' \item{\code{weekday}}{week day, ranging from Sunday (\code{1}) to Saturday (\code{7})}
#' \item{\code{weekend}}{binary indicator for week-end, \code{0} on week-ends and \code{1} otherwise}
#' }
#'
#' @author Léo Belzile
#' @source Bixi (bike rental), Environnement Canada
"bixi"


#' Illustration of collinearity using Bixi rentals
#'
#' This dataset gives the total numbers of daily rentals between 2014 and 2019
#' of Bixi in Montreal as a function of the temperature (recorded at 16:00).
#'  These data are used to illustrate the effect of collinearity using rounding.
#'
#' @docType data
#' @format a data frame of 1184 observations of the following variables
#' \describe{
#' \item{\code{lognusers}}{log of the total number of daily rentals}
#' \item{\code{celcius}}{temperature at the nearby airport (in Celcius)}
#' \item{\code{farenheit}}{temperature at the nearby airport (in Farenheit)}
#' \item{\code{rfarenheit}}{temperature at the nearby airport (in Farenheit), rounded to the nearest unit}
#' }
#'
#' @author Léo Belzile
#' @source Bixi, Environnement Canada
"bixicoll"

#' Intention to buy candies based on an advertisement
#'
#' In a study performed at Tech3Lab, subjects navigated a website that contained, among other things, an advertisement for candies. During the site navigation, an ``eye-tracker'' measured the location on the screen on which the subject's eyes were fixated.
#' The tracker also recorded whether the subject saw the ad and for how long it was in sight.
#' Additionally, facial expression analysis software (FaceReader) can be used to guess the subject's emotions when the ad was in sight.
#' At the end of the study, a questionnaire measured the subject's intention to buy this type of candy and socio-demographic variables.
#' Only the 120 subjects that had seen the ad in question are included in the data
#'
#' @source Marc Fredette
#' @docType data
#' @format a data frame of 120 observations containing the following variables
#' \describe{
#' \item{\code{intention}}{discrete variable ranging between \code{2} and \code{14}; larger values indicate higher interest in buying the product. Specifically, the score was constructed by summing the response of two questions, both measured using a Likert scale ranging from strongly disagree (\code{1}) to strongly agree (\code{7}).}
#' \item{\code{fixation}}{the total duration of fixation on the ad (in seconds).}
#' \item{\code{emotion}}{a measure of reaction during fixation; the ratio of the probability of showing a positive emotion to the probability of showing a negative emotion.}
#' \item{\code{sex}}{sex of subject, either man (\code{0}) or woman (\code{1}).}
#' \item{\code{age}}{age (in years).}
#' \item{\code{revenue}}{categorical variable indicating the subject's annual income; one of (\code{1}) [0,  20k); (\code{2}) [20k,  60k); (\code{3}) 60k and above.}
#' \item{\code{educ}}{categorical variable indicating the highest educational achievement, either (\code{1}) high school or lower; (\code{2}) college or (\code{3}) university degree.}
#' \item{\code{marital}}{civil status, either single (\code{0}) or in a relationship (\code{1}).}
#' \item{\code{buy}}{binary variable indicating if the person bought candies.}
#' \item{\code{nitem}}{number of candy packs bought.}
#' }
"intention"

#' Wind turbine production
#'
#' The \code{windturbine} data contains measurements of electricity output of wind turbine over 25 separate fifteen minute periods. We are interested in the relation between direct output
#' and the average wind speed (measured in miles per hour) during the recording.
#'
#' @docType data
#' @format a data frame of 25 observations of the following two variables
#' \describe{
#' \item{\code{velocity}}{wind velocity (miles per hour)}
#' \item{\code{output}}{power generated (in DC volts)}
#' }
#' @seealso \link[BSDA]{Windmill}
#' @source Joglekar et al. (1989), Lack of Fit Testing when Replicates Are Not Available, \emph{The American Statistician}, 43,(\bold{3}), 135-143.
#' @references Kitchens, L. J. (2003) \emph{Basic Statistics and Data Analysis}. Pacific Grove, CA: Brooks/Cole, a division of Thomson Learning.
"windturbine"


#' Air passengers
#'
#'  Monthly totals of international airline passengers, 1949 to 1960.
#'
#' @docType data
#' @source Box, G. E. P., Jenkins, G. M. and Reinsel, G. C. (1976) \emph{Time Series Analysis, Forecasting and Control}. Third Edition. Holden-Day. Series G.
#' @seealso \link[datasets]{AirPassengers}
#' @format a data frame of 144 observations containing the following variables
#' \describe{
#' \item{\code{passengers}}{number of international air passengers (in thousands).}
#' \item{\code{month}}{integer indicating the month of the measurement, ranging from January (\code{1}) to December (\code{12}).}
#' \item{\code{year}}{year of measurement}
#' }
"airpassengers"


#' Automobile characteristics
#'
#' Fuel consumption and power of automobiles. The dataset was used in the 1983 American Statistical Association Exposition.
#' @source The dataset was collected by Ernesto Ramos and David Donoho and is provided by the StatLib library at Carnegie Mellon University.
#'
#' @references James, G., Witten, D., Hastie, T., and Tibshirani, R. (2013) \emph{An Introduction to Statistical Learning with applications in R}, Springer-Verlag, New York
#'
#' @seealso \link[ISLR]{Auto}
#' @docType data
#' @format a data frame of 392 observations on the following variables
#' \describe{
#' \item{\code{mpg}}{fuel consumption (in miles per US gallon)}
#' \item{\code{cylinders}}{factor, the number of cylinders in the car}
#' \item{\code{displacement}}{engine displacement (in cubic inches)}
#' \item{\code{horsepower}}{engine horsepower}
#' \item{\code{weight}}{vehicle weight (in pounds)}
#' \item{\code{acceleration}}{time to accelerate from 0 to 60 mph (in seconds)}
#' }
"auto"

#' Road traffic accidents and speed limits experiment on motorway in Sweden
#'
#' In this experiment, data were collected on the same days in two consecutive years, and
#' speed limits were sometimes enforced in either. The purpose of the analysis is to analyse
#' the effect of the traffic limits.
#'
#' @references Svensson, A. (1981) \emph{On a goodness-of-fit test for multiplicative Poisson models}. Annals of Statistics \bold{9}, 697–704.
#'
#' @docType data
#' @format a data frame in long format of 184 observations on the following variables
#' \describe{
#' \item{\code{accidents}}{integer; daily number of accident}
#' \item{\code{day}}{integer; day of the experiment, ranging from 1 to 92}
#' \item{\code{year}}{integer; year of the measurement, either 1961 or 1962}
#' \item{\code{limit}}{logical: was a speed limit enforced?}
#' }
"sweden"

#' Florida's 2000 presidential election results
#'
#' This database contains demographic variables and the number
#' of votes for the major candidates, Bush and Gore, as well
#' as the ballots cast for Pat Buchanan for each of the 67 counties.
#'
#'
#' @source Smith, R.L. (2002). \emph{A statistical assessment of Buchanan's vote in Palm Beach County}, \bold{17}(4), 441-457.
#' @docType data
#' @format a data frame in long format of 67 observations on the following variables
#' \describe{
#' \item{\code{accidents}}{integer; daily number of accident}
#' \item{\code{county}}{name of county}
#' \item{\code{popn}}{population of the county in 1997}
#' \item{\code{white}}{percentage of whites in 1996}
#' \item{\code{black}}{percentage of blacks in 1996}
#' \item{\code{hisp}}{percentage of Hispanics in 1996}
#' \item{\code{geq65}}{percentage of the population aged 65 and above based on 1996 and 1997 population estimates}
#' \item{\code{highsc}}{percentage of the population with a high school degree (1990 Census data)}
#' \item{\code{coll}}{percentage of the population that are college graduates (1990 Census data)}
#' \item{\code{income}}{mean personal income in 1994}
#' \item{\code{buch}}{total ballots cast for Pat Buchanan (Reform)}
#' \item{\code{bush}}{total ballots cast for Georges W. Bush (GOP)}
#' \item{\code{gore}}{total ballots cast for Al Gore (Democrat)}
#' \item{\code{totmb}}{the total number of votes cast for the presidential election in each county, minus Buchanan votes}
#' }
"buchanan"



#' Waiting time for the Montreal metro
#'
#' Time (in seconds) from 17:59 until the departure of the next metro at the Universite de Montreal station
#' during week-days over three consecutive months
#'
#' @docType data
#' @format a numeric vector with 62 observations
#' \describe{
#' \item{\code{waiting}}{time (in seconds) before the next metro departure}
#' }
#' @source STM
"waiting"

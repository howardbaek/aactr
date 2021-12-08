#' Establish a connection to AACT database
#'
#' This function allows you to access the PostgreSQL AACT
#'database in the cloud using R without needing to install PostgreSQL on your
#'local machine.
#'
#' To get started, please create a database account at this link: \cr
#' \url{https://aact.ctti-clinicaltrials.org/users/sign_up}. \cr
#' \cr
#' To securely save credentials, create a config yaml file: \code{yaml::write_yaml(data.frame(user = "USERNAME", password = "PASSWORD"), "config").}
#' Then, load the config file and save it to an object: \code{config <- yaml::yaml.load_file("config")}.
#' Now, you can safely access your database credentials with \code{config$user} and \code{config$password}. \cr
#'
#' Alternatively, you can directly enter your username and password as arguments.
#'
#'@param user A character vector containing username of database account
#'@param password A character vector containing password of database account

#' @import RPostgreSQL
#' @import DBI
#' @import yaml
#' @export
#' @author Howard Baek <howardba@uw.edu>
#'
#' @examples
#' \dontrun{
#' con <- aact_connect(config$user, config$password)
#' }
#'
#' @seealso
#' \itemize{
#'   \item \url{https://aact.ctti-clinicaltrials.org/r}
#'   \item \url{https://aact.ctti-clinicaltrials.org/points_to_consider}
#' }

aact_connect <- function(user, password) {

  drv <- DBI::dbDriver('PostgreSQL')
  con <- DBI::dbConnect(drv,
                   dbname = "aact",
                   host = "aact-db.ctti-clinicaltrials.org",
                   port = 5432,
                   user = user,
                   password = password)

  return(con)
}

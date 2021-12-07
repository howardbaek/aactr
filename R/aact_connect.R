#'Connect to AACT database.
#'
#'According to \href{https://aact.ctti-clinicaltrials.org/r}{
#' Connect to AACT using R}, this function allows you to access the PostgreSQL AACT
#'database in the cloud using R without needing to install PostgreSQL on your
#'local machine.
#'
#' First, create a config yaml file to securely save credentials: \code{yaml::write_yaml(data.frame(user = "USERNAME", password = "PASSWORD"), "config")}
#' Then, load config file and save to an object: \code{config <- yaml::yaml.load_file("config")}
#'
#'@param user A character vector containing username: \code{config$user}
#'@param password A character vector containing password: \code{config$password}
#'@param password A character vector containing password: \code{config$password}

#' @import RPostgreSQL
#' @import DBI
#' @import yaml
#' @export
#' @author Howard Baek <howardba@uw.edu>
#'
#' @examples
#' \dontrun{
#' aact_connect(config$user, config$password)
#' }
#'
#' @seealso \url{https://aact.ctti-clinicaltrials.org/points_to_consider}

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

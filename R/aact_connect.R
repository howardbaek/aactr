#'Connect to AACT database.
#'
#'According to \href{https://aact.ctti-clinicaltrials.org/r}{this AACT
#'documentation}, this function allows you to access the PostgreSQL AACT
#'database in the cloud using R without needing to install PostgreSQL on your
#'local machine.
#'
#'@param user A character vector containing username.
#'@param password A character vector containing password.

#' @import RPostgreSQL
#' @import DBI
#' @export
#' @author Jason Baik <joonwoob@andrew.cmu.edu>
#'
#' @examples
#' \dontrun{
#' aact_connect("myid", "mypassword")
#' }
#'
#' @seealso \url{https://aact.ctti-clinicaltrials.org/points_to_consider}

aact_connect <- function(user, password) {

  drv <- DBI::dbDriver('PostgreSQL')
  con <- DBI::dbConnect(drv,
                   dbname="aact",
                   host="aact-db.ctti-clinicaltrials.org",
                   port=5432,
                   user=user,
                   password=password)

}

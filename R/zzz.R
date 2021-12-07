.onAttach <- function(libname, pkgname) {

  startup_msg <- c(
    "Welcome to aactr!",
    "To use this package, please create your database account at this link:",
    "https://aact.ctti-clinicaltrials.org/users/sign_up"
  )

  packageStartupMessage(paste(startup_msg, collapse = "\n"))
}

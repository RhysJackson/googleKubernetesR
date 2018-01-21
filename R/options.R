.onLoad <- function(libname, pkgname) {

  options(
    googleAuthR.scopes.selected = c("https://www.googleapis.com/auth/cloud-platform"),
    googleAuthR.client_id = "183315784647-8u0k3nl53tgeq34vnebi7gk6pd7hqj3o.apps.googleusercontent.com",
    googleAuthR.client_secret = "LZN22bmtW8Y6cfjk-pGUwz9w"
  )

  invisible()

}

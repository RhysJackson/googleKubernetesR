.onLoad <- function(libname, pkgname) {

  options(
    googleAuthR.scopes.selected = c("https://www.googleapis.com/auth/cloud-platform"),
    googleAuthR.client_id = "586081861104-8or7hjrgmnud04of91ifd00mk1kv70ba.apps.googleusercontent.com",
    googleAuthR.client_secret = "u4CQfxDyEPwncBDRIR4M0iDV"
  )

  invisible()

}

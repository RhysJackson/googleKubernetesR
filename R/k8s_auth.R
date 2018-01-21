#' k8s_auth
#'
#' Calls googleAuthR to authenticate with the Google Cloud Platform
#' @keywords k8s_auth
#' @param json Path to your json client_secret credentials.
#' @importFrom googleAuthR gar_auth
#' @export
#' @examples
#' k8s_auth()
#' k8s_auth(json = "client_secret.json")

k8s_auth <- function(json = NULL) {
  if(is.null(json)) {
    googleAuthR::gar_auth()
  } else {
    googleAuthR::gar_set_client(json)
  }
}

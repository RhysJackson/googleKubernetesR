#' k8s_auth
#'
#' Calls googleAuthR to authenticate with the Google Cloud Platform
#' @keywords k8s_auth
#' @importFrom googleAuthR gar_auth
#' @export
#' @examples
#' k8s_auth()

k8s_auth <- function() {
  googleAuthR::gar_auth()
}

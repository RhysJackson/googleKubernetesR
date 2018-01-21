#' k8s_auth
#'
#' Calls googleAuthR to authenticate with the Google Cloud Platform
#' @keywords k8s_auth
#' @param json OPTIONAL Path to your JSON client_secret credentials.
#' @param service_account_json OPTIONAL Path to your JSON service account credentials
#' @importFrom googleAuthR gar_auth
#' @export
#' @examples
#' k8s_auth()
#' k8s_auth(json = "client_secret.json")
#' k8s_auth(service_account_json = "service_account.json")

k8s_auth <- function(json = NULL, service_account_json = NULL) {

  if(!is.null(json)) {
    # If json client ID credentials are provided, use gar_set_client() to set the credentials
    googleAuthR::gar_set_client(json)
  }

  if(is.null(service_account_json)) {
    # If no service token provided, use gar_auth()
    googleAuthR::gar_auth()
  } else {
    # Else use gar_auth_service()
    googleAuthR::gar_auth_service(service_account_json)
  }

}

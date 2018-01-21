#' getServerConfig
#'
#' Returns configuration info about the Kubernetes Engine service.
#' @param projectId The Google Developers Console project ID or project number.
#' @param zone The name of the Google Compute Engine zone in which the cluster resides.
#' @keywords projects.locations.getServerConfig
#' @importFrom googleAuthR gar_api_generator
#' @export
#' @examples
#' getServerConfig(projectId = "myProjectId", zone = "europe-west1-d")

getServerConfig <- function(projectId, zone) {
  f <- gar_api_generator("https://container.googleapis.com/v1beta1",
                    "GET",
                    path_args = list(projects = projectId, locations = zone, serverConfig = ""))
  f()
}

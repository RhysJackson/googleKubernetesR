#' completeIpRotation
#'
#' Completes master IP rotation.
#' @param projectId The Google Developers Console project ID or project number.
#' @param zone The name of the Google Compute Engine zone in which the cluster resides.
#' @param clusterId The name of the cluster.
#' @keywords projects.locations.getServerConfig
#' @export
#' @examples
#' completeIpRotation(projectId = "myProjectId", zone = "europe-west1-d", clusterId = "cluster-1")

completeIpRotation <- function(projectId, zone, clusterId) {
  f <- gar_api_generator("https://container.googleapis.com/v1beta1",
                         "POST",
                         path_args = list(projects = projectId, locations = zone, clusters = clusterId, `:completeIpRotation` = ""))
  f()
}

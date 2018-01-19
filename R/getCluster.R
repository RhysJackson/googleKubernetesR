#' getCluster
#'
#' Gets the details of a specific cluster.
#' @param projectId The Google Developers Console project ID or project number.
#' @param zone The name of the Google Compute Engine zone in which the cluster resides.
#' @param clusterId The name of the cluster to retrieve.
#' @keywords projects.locations.clusters.get
#' @export
#' @examples
#' getCluster(projectId = "myProjectId", zone = "europe-west1-d", clusterId = "cluster-1")

getCluster <- function(projectId, zone, clusterId) {
  f <- gar_api_generator("https://container.googleapis.com/v1beta1",
                         "GET",
                         path_args = list(projects = projectId, locations = zone, clusters = clusterId))
  f()
}

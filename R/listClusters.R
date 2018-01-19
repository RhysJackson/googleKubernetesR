#' listClusters
#'
#' Lists all clusters owned by a project in either the specified zone or all zones.
#' @param projectId The Google Developers Console project ID or project number.
#' @param zone The name of the Google Compute Engine zone in which the cluster resides, or "-" for all zones. Defaults to all zones.
#' @keywords projects.locations.clusters.get
#' @export
#' @examples
#' listClusters(projectId = "myProjectId", location = "europe-west1-d")

listClusters <- function(projectId, zone = "-") {
  f <- gar_api_generator("https://container.googleapis.com/v1beta1",
                         "GET",
                         path_args = list(projects = projectId, locations = zone, clusters = ""))
  f()
}

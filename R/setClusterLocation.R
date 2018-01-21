#' setClusterLocation
#'
#' Sets the locations of a specific cluster.
#' @param projectId The Google Developers Console project ID or project number.
#' @param zone The name of the Google Compute Engine zone in which the cluster resides.
#' @param clusterId The name of the cluster to upgrade.
#' @param locations The desired list of Google Compute Engine locations in which the cluster's nodes should be located. Changing the locations a cluster is in will result in nodes being either created or removed from the cluster, depending on whether locations are being added or removed. This list must always include the cluster's primary zone.
#' @keywords projects.zones.clusters.locations
#' @importFrom googleAuthR gar_api_generator
#' @export
#' @examples
#' setClusterLocation(projectId = "myProjectId",
#'                    zone = "europe-west1-d",
#'                    clusterId = "r-cluster",
#'                    locations = c("europe-west1-d",
#'                                  "europe-west1-b"))

setClusterLocation <- function(projectId, zone, clusterId, locations) {

  body <- list(
    locations = locations
  )

  f <- gar_api_generator("https://container.googleapis.com/v1beta1",
                         "POST",
                         path_args = list(projects = projectId,
                                          zones = zone,
                                          clusters = clusterId,
                                          locations = ""))

  f(the_body = body)

}


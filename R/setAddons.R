#' setAddons
#'
#' Sets the addons of a specific cluster.
#' @param projectId The Google Developers Console project ID or project number.
#' @param zone The name of the Google Compute Engine zone in which the cluster resides.
#' @param clusterId The name of the cluster to retrieve.
#' @keywords projects.zones.clusters.addons
#' @importFrom googleAuthR gar_api_generator
#' @export
#' @examples setAddons(projectId = "myProjectId",
#'   location = "europe-west1-d",
#'   clusterId = "cluster-1",
#'   addonsConfig = list(
#'     httpLoadBalancing = list(
#'       disabled = FALSE
#'     )
#'   )
#' )

setAddons <- function(projectId, zone, clusterId, addonsConfig) {
  body <- list(
    addonsConfig = addonsConfig
  )
  f <- gar_api_generator("https://container.googleapis.com/v1beta1",
                         "POST",
                         path_args = list(projects = projectId, zones = zone, clusters = clusterId, addons = ""))
  f(the_body = body)
}

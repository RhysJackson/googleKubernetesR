#' deleteCluster
#'
#' Deletes the cluster, including the Kubernetes endpoint and all worker nodes.
#' Firewalls and routes that were configured during cluster creation are also deleted.
#' Other Google Compute Engine resources that might be in use by the cluster (e.g. load balancer resources) will not be deleted if they weren't present at the initial create time.
#' @param projectId The Google Developers Console project ID or project number.
#' @param zone The name of the Google Compute Engine zone in which the cluster resides.
#' @param clusterId The name of the cluster to delete.
#' @keywords projects.zones.clusters.delete
#' @importFrom googleAuthR gar_api_generator
#' @export
#' @examples
#' deleteCluster(projectId = "myProjectId", zone = "europe-west1-d", clusterId = "r-cluster")

deleteCluster <- function(projectId, zone, clusterId) {

  f <- gar_api_generator("https://container.googleapis.com/v1beta1",
                         "DELETE",
                         path_args = list(projects = projectId, zones = zone, clusters = clusterId))

  f()

}


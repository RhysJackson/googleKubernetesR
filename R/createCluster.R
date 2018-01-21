#' createCluster
#'
#' Creates a cluster, consisting of the specified number and type of Google Compute Engine instances.
#' By default, the cluster is created in the project's default network.
#' One firewall is added for the cluster. After cluster creation, the cluster creates routes for each node to allow the containers on that node to communicate with all other instances in the cluster.
#' Finally, an entry is added to the project's global metadata indicating which CIDR range is being used by the cluster.
#' @param projectId The Google Developers Console project ID or project number.
#' @param zone The name of the Google Compute Engine zone in which the cluster resides.
#' @param clusterSpec A cluster specification. If no specification is provided, a 3 node, 100Gb disk, n1-standard-1 cluster will be created with the name "r-cluster". See here for specification: https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1beta1/projects.zones.clusters
#' @keywords projects.zones.clusters.create
#' @importFrom googleAuthR gar_api_generator
#' @export
#' @examples
#' createCluster(projectId = "myProjectId", zone = "europe-west1-d")

createCluster <- function(projectId, zone, clusterSpec = NULL) {

  if(is.null(clusterSpec)) {
    clusterSpec <- list(
      name = "r-cluster",
      initialNodeCount = 3,
      nodeConfig = list(
        machineType = "n1-standard-1",
        diskSizeGb = 100,
        oauthScopes = c("https://www.googleapis.com/auth/compute", "https://www.googleapis.com/auth/devstorage.read_only"),
        imageType = ""
      )
    )
  }

  body <- list(
    cluster = clusterSpec
  )

  f <- gar_api_generator("https://container.googleapis.com/v1beta1",
                         "POST",
                         path_args = list(projects = projectId, zones = zone, clusters = ""))

  f(the_body = body)

}


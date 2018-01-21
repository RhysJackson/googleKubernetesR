# googleKubernetesR

An R package for the Google Kubernetes Engine API

## Thanks
A big thank you to Mark Edmondson for the [`googleAuthR`](http://code.markedmondson.me/googleAuthR/) package which is used extensively in this project.

## Currently implemented
* [projects.locations.clusters.get](https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1beta1/projects.locations.clusters/get)
* [projects.locations.getServerConfig](https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1beta1/projects.locations/getServerConfig)
* [projects.zones.clusters.list](https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1beta1/projects.zones.clusters/list)
* [projects.zones.clusters.create](https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1beta1/projects.zones.clusters/create)
* [projects.zones.clusters.delete](https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1beta1/projects.zones.clusters/delete)
* [projects.zones.clusters.addons](https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1beta1/projects.zones.clusters/addons)
* [projects.zones.clusters.locations](https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1beta1/projects.zones.clusters/locations)

## Installation
```
devtools::install_github("RhysJackson/googleKubernetesR")
```

## Examples

### Create a cluster
```
# Create a 3 node, n1-standard-1, 100Gb disk, cluster with the name 'r-cluster'
# Cluster comes configured with recommended scopes https://www.googleapis.com/auth/compute and https://www.googleapis.com/auth/devstorage.read_only
createCluster(projectId = "myProject", "europe-west1-d")
```

```
# Create 5 node, n1-highmem-2, 500Gb disk, cluster with read/write access to Google Cloud Storage

# Define the cluster spec
clusterSpec <- list(
  name = "my-cluster",
  initialNodeCount = 5,
  nodeConfig = list(
    machineType = "n1-highmem-2",
    diskSizeGb = 500,
    oauthScopes = c("https://www.googleapis.com/auth/compute",
    				"https://www.googleapis.com/auth/devstorage.read_write")
  )
)

# Create the cluster
createCluster(projectId = "myProject",
			  zone = "europe-west1-d",
			  clusterSpec = clusterSpec)
```

### List Clusters
```
# List all clusters in a project
res <- listClusters(projectId = "myProject")
```

```
# List all clusters in a specific zone
res <- listClusters(projectId = "myProject", zone = "europe-west1-d")
```

### Set addons for an existing cluster
See the [AddonsConfig](https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1beta1/projects.locations.clusters#Cluster.AddonsConfig) documentation for details on how to specify the addonsConfig argument
```
# Define the addons configuration
addonsConfig <- list(
					httpLoadBalancing = list(disabled = TRUE)
		  		)

# Disable the HTTP Load Balancing addon
setAddons(projectId = "myProject",
		  projectLocation = "europe-west1-d",
		  clusterId = "my-cluster",
		  addonsConfig = addonsConfig)
```

### Delete Cluster
```
res <- deleteCluster(projectId = "myProject", zone = "europe-west1-d", clusterId = "my-cluster")
```

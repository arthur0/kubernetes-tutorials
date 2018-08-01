[WIP] This is a Work in Progress

### Choosing cloud providers
 
Kubernetes can run on [variuos plataforms](https://kubernetes.io/docs/setup/pick-right-solution/), such as your computer, VMs on a cloud provider or bare metal servers.
If you are already able to create your Kubernetes clusters using your preferred plataform, that's great.

This repository is intended to guide you to work with multiple providers (*multi-cloud*). Currently, we are using a free tier service of
[GCP](https://cloud.google.com/free/),
[AWS](http://aws.amazon.com/free) and
[Azure](https://azure.microsoft.com/free/). Try this out.

In addition to public clouds, you'll also find guides for using Kubernetes with the OpenStack cloud provider for private ones, further on exploring capabilities between them (*hybrid cloud*).

### First steps
 
1. Install CLI Tools (Google Cloud SDK, AWS CLI and Azure CLI)
    * [Debian and Ubuntu](/cli-tools/debian-ubuntu/README.md)
1. Kubernetes [Overview](creating-clusters/README.md)
1. Creating a Kubernetes Clusters
    * [On-premise](creating-clusters/on-premise/README.md)
    * [AWS](creating-clusters/aws/README.md) 
    * [Azure](creating-clusters/azure/README.md) 
    * [Google Cloud Plataform](creating-clusters/gcp/README.md) 
    * [OpenStack](creating-clusters/openstack/README.md)


### Federation (TODO)

1. Multi-cluster Management
1. Federation API
1. Setting up a Federation
    * Multi-cluster:
        * Fully on Google Cloud Platform
        * Cross-Cluster Service Discovery
    * Multi-cloud:
        * On GCP and AWS
    * Hybrid-cloud:
        * OpenStack + GCP + AWS + Azure


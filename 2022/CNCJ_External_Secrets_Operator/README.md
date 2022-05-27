# CNCJ - External_Secrets_Operator - May 2022 
    25 May 2022 - Cloud Native Computing Johannesburg May Meetup 

## Abstract 
Managing secrets in Kubernetes can be a cumbersome job. How do you store and rotate your credentials currently in your project?

With External Secrets Operator (ESO for short) we leverage multi-featured solutions like AWS Secret Manager, Azure Key Vault and Hashicorp Vault to manage your sensitive data declaratively and securely. You end up with native Kubernetes secrets in your cluster, synchronized continuously with your external provider.

In this presentation, we are going to talk about the origins of ESO and the different projects that wanted to solve the same problem. The open-source centralized solution was developed with the help of the community.

Presentation: The first half of the talk will be us telling you ESO’s story, and the second half will be a demo of ESO in action.

## Infrastructure

Within the ```./infra``` directory, there is a collection of Terraform files that create the following resources:

- manifests
    - ExternalSecret.yaml
    - SecretStore.yaml
- data.tf
- eso.tf
- files.tf
- keyvault.tf
- main.tf
- network.tf
- providers.tf
- secret.tf
- service_principal.tf
- vars.tf


## Video / Recording

 [![External Secrets Operator: A Cloud Native way to manage your secrets](https://img.youtube.com/vi/phohsHfl55A/0.jpg)](https://www.youtube.com/watch?v=phohsHfl55A)
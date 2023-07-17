## IAM permissions

The Role required to deploy this GKE addons module is:

```json
[
    "compute.addresses.create",
    "compute.addresses.delete",
    "compute.addresses.get",
    "compute.firewalls.create",
    "compute.firewalls.delete",
    "compute.firewalls.get",
    "compute.firewalls.update",
    "compute.networks.updatePolicy",
    "compute.networks.use",
    "compute.subnetworks.use",
    "iam.serviceAccounts.create",
    "iam.serviceAccounts.delete",
    "iam.serviceAccounts.get",
    "iam.serviceAccounts.update",
    "resourcemanager.projects.getIamPolicy",
    "resourcemanager.projects.setIamPolicy"
  ]
```
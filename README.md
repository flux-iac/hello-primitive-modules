# Hello World Primitive Module

This is an example primitive module for TF-controller.
It requires TF-controller v0.13.0-rc.2 to run the example in this repo.

## Primitive module

What is a primitive module? 

  1. It's a Terraform module that contains only a single resource.
  2. A Terraform primitive module must contains the "values" variable.
  3. The "values" variable must be an object with fields of option types.
  4. The module must be placed under a directory, which is named after the resource.
  5. The directory can optionally contain other files, for example the .terraform.lock.hcl.
  6. We call a set of primitive module bundled into an OCI image **a package**.

## Example

For example, we have an imaginary resource "aws_hello_world", so here's the directory structure.

```bash
❯ tree .
.
├── aws_hello_world
│   └── main.tf
└── README.md

1 directory, 2 files
```

## How to use this module.

```yaml
cat << EOF | kubectl apply -f -
---
apiVersion: source.toolkit.fluxcd.io/v1beta2
kind: OCIRepository
metadata:
  name: hello-package-v4.32.0
  namespace: flux-system
spec:
  interval: 30s
  url: oci://ghcr.io/tf-controller/hello-primitive-modules/v4.32.0
  ref:
    tag: v1
---
apiVersion: infra.contrib.fluxcd.io/v1alpha1
kind: Terraform
metadata:
  name: hello-world
  namespace: flux-system
spec:
  path: aws_hello_world
  values:
    greeting: Hi
    subject: my world
  sourceRef:
    kind: OCIRepository
    name: hello-package-v4.32.0
  interval: 1h0m
  approvePlan: auto
EOF
```

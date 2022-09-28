# Hello World Primitive Module

This is an example primitive module for TF-controller.

## Primitive module

What is a primitive module? 

  1. It's a Terraform module that contains only a single resource.
  2. A Terraform primitive module must contains the "values" variable.
  3. The "values" variable must be an object with fields of option types.
  4. The module must be placed under a directory, which is named after the resource.
  5. The directory can optionally contain other files, for example the .terraform.lock.hcl.

## Example

For example, we have an imaginary resource "hello_world", so here's the directory structure.

```bash
❯ tree .
.
├── hello_world
│   └── main.tf
└── README.md

1 directory, 2 files
```

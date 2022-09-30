
# Repository usage information


This repository contains:

### helper_scripts folder
Store helper scripts that could be used to setup the repository on github and gcp

### pre-commit
The pre-commit hooks can be installed and will block commits inside the main branch and also run terraform-docs against any README files that are in the same folder as terraform files

### cloudbuild
The cloudbuild pipeline files that will be used to deploy the project

### Makefile
This file contains shortcuts to run the cloudbuild project setup and github branch protection, as well if the environments folder contains a "local" subfoler (git ignored preferable) the make file is capable of run the terraform apply from this folder to be used for test the environment build locally against any account on google cloud

#### Makefile usage
```rust
make cloudbuild
# This command will configure cloudbuild on the current tracked project inside the gcloud cli 

make branch_protection
# This command will ask for oragnization name and repository name to setup branch protection based on the parameters on the file inside helper_scripts

make local
# Deployes the local development environment on gcloud based on the configurations of the local environment setup
```

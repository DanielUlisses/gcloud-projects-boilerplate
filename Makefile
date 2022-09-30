# configuration setup

cloudbuild:
	./helper_scripts/cloudbuild_project_setup.sh

branch_protection:
	./helper_scripts/github_branch_protection_setup.sh


# terraform

local:
	cd environments/local
	terraform init
	terraform plan
	terraform apply
	cd ../..

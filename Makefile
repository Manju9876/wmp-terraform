dev-apply:
	git pull
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=env-dev/state.tfvars
	terraform apply -auto-approve
	## User name and password should not be hardcoded, Here we just hardcorded because to avoid the passing of input. this need to be passed as input in the real time.


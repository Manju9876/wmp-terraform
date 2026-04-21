terraform_apply:
	git pull
	terraform init
	terrafom apply -auto--approve

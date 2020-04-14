.ONESHELL:
.SHELL := /usr/bin/bash
.PHONY: fmt graph inputs providers test clean

export TF_IN_AUTOMATION=1
export TF_INPUT=0

fmt:
	@terraform fmt -recursive

test: fmt
	@cd test
	@terraform init
	@terraform validate
	@terraform plan -out=plan.tfplan
	@terraform apply -refresh=false plan.tfplan
	@rm -f plan.tfplan

providers:
	@terraform providers

graph:
	@terraform graph

inputs:
	@terraform-docs pretty . \
		--no-providers \
		--no-outputs \
		--sort-by-required

update-readme:
	@test -f README.backup.md \
		&& echo Delete backup before updating README.md \
		&& exit 42 \
		|| cp README.md README.backup.md
	@sed -n '/## Providers/q;p' README.backup.md > README.md
	@terraform-docs md . >> README.md

clean:
	@find . -depth -type d -name '.terraform' -exec rm -rf '{}' +
	@find . -depth -type f -a '(' \
		-name '*.log' \
		-o \
		-name '*.tfstate' \
		-o \
		-name '*.tfstate.*' \
		-o \
		-name '*.tfplan' \
		-o \
		-name '*.backup.md' \
	')' -exec rm -rf '{}' +

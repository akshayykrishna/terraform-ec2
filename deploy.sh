#!/bin/bash
terraform init -input=false
terraform plan -out=tfplan
terraform apply -auto-approve tfplan


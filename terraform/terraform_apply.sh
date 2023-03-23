#!/bin/bash

FOLDERS=("vpc" "sgr" "ec2" "sns" "cloudwatch")

echo "----- Terraform Apply -----"

for folder in "${FOLDERS[@]}"
do
  echo "---------------------------"
  echo "Terraform applying module $folder"
  echo "---------------------------"
  cd ./$folder
  terraform apply --auto-approve
  cd ..
  echo " "
done
#!/bin/bash

FOLDERS=("vpc" "sgr" "ec2" "sns" "cloudwatch")

echo "----- Terraform init -----"

for folder in "${FOLDERS[@]}"
do
  echo "---------------------------"
  echo "Terraform init $folder"
  echo "---------------------------"
  cd ./$folder
  sudo rm -r .terraform
  terraform init
  cd ..
  echo " "
done
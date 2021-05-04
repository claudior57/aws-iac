#!/bin/bash

#FOLDERS=("vpc")
#FOLDERS=("sgr")
#FOLDERS=("ec2")
#FOLDERS=("sns")
FOLDERS=("cloudwatch")
#FOLDERS=("vpc" "sgr" "ec2" "sns")

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
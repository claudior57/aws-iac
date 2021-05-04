#!/bin/bash

#FOLDERS=("vpc")
#FOLDERS=("sgr")
#FOLDERS=("ec2")
FOLDERS=("cloudwatch" "sns" "ec2" "sgr" "vpc")

echo "----- Terraform Destroy -----"

for folder in "${FOLDERS[@]}"
do
  echo "---------------------------"
  echo "Terraform destroying module $folder"
  echo "---------------------------"
  cd ./$folder
  terraform destroy --auto-approve
  cd ..
  echo " "
done
#!/bin/bash

#FOLDERS=("vpc")
#FOLDERS=("sgr")
#FOLDERS=("ec2")
#FOLDERS=("sns")
FOLDERS=("cloudwatch")

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
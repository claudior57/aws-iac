#!/bin/bash

#FOLDERS=("vpc")
#FOLDERS=("sgr")
#FOLDERS=("ec2")
#FOLDERS=("sns")
FOLDERS=("cloudwatch")

echo "----- Terraform Plan -----"

for folder in "${FOLDERS[@]}"
do
  echo "---------------------------"
  echo "Terraform planning module $folder"
  echo "---------------------------"
  cd ./$folder
  terraform plan
  cd ..
  echo " "
done


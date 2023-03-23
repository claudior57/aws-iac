#!/bin/bash

FOLDERS=("vpc" "sgr" "ec2" "sns" "cloudwatch")

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


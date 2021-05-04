#!/bin/bash

FOLDERS=("vpc" "sgr" "ec2" "sns" "cloudwatch")

echo "----- Terraform fmt -----"

for folder in "${FOLDERS[@]}"
do
  echo "---------------------------"
  echo "Terraform formating module $folder"
  echo "---------------------------"
  cd ./$folder
  terraform fmt
  cd ..
  echo " "
done
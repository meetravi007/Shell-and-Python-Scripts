#!/bin/bash
echo --This script created by Ravindra Bhargava---
echo "Please select below option"
echo "1. To see all available projects in your GCP"
echo "2. Creating a Virtual Machine using command line"
echo "3. Deleting a Virtual Machine using command line"
echo "4. Create a bucket storage under a specific project"
echo "5. Delete a bucket storage under a specific project"
echo "6. Uploading a file in your storage"
echo ""
read -p "Enter Choice:" choice
if [ "$choice" = "1" ] ; then 
	echo ""
	echo "BELOW IS THE AVAILABLE PROJECTS IN YOUR GCP ACCOUNT"
	gcloud projects list 
else
if [ "$choice" = "6" ] ; then
	echo ""
	echo "BELOW IS THE AVAILABLE FILES IN YOUR CURRENT DIRECTORY:-"
	ls -lrt
	read -p "ENTHER THE FILE WHICH YOU NEED TO UPLOAD: " filename
	echo ""
	gsutil cp $filename gs://learning-gcs-shell
else
if [ "$choice" = "3" ]; then
echo "PLEASE ENTER BUCKET DETAILS IN THIS FORMAT:- 
<gcloud compute --project=<project_id> instances delete <vm_name> --zone=<zone_name>"
read -p "ENTER THE COMMAND FOLLWING ABOVE SYNTAX TO DELETE YOUR VM:" ENTER
echo ""
$ENTER
else	
if [ "$choice" = "2" ]; then
echo "PLEASE ENTER BUCKET DETAILS IN THIS FORMAT:- 
<gcloud compute --project=<project_id> instances create <vm_name> --zone=<zone_name>"
read -p "ENTER THE COMMAND FOLLWING ABOVE SYNTAX TO CREATE YOUR VM:" ENTER
echo ""
$ENTER
else
if [ "$choice" = "4" ]; then
echo "PLEASE ENTER BUCKET DETAILS IN THIS FORMAT:- 
<gsutil mb -p <project_id> gs://<bucket_name>"
read -p "ENTER THE COMMAND FOLLWING ABOVE SYNTAX TO CREATE YOUR BUCKET:" ENTER
echo ""
$ENTER
else
	if [ "$choice" = "5" ]; then
	echo "PLEASE ENTER BUCKET DETAILS IN THIS FORMAT:- 
<gsutil rm -r  gs://<bucket_name>"
read -p "ENTER THE COMMAND FOLLWING ABOVE SYNTAX TO CREATE YOUR BUCKET:" ENTER
echo ""
$ENTER
	fi
fi
fi
fi
fi
fi
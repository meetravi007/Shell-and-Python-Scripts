#!/bin/sh

# Author        : Ravindra Bhargava
# Email         : meetravi007@gmail.com
# Description   : Jenkins deploy script using docker hub on Kubernetes
# website       : https://ravindrabhargava.com
# Documentation : https://www.terraform.io/docs/commands/apply.html

echo -n "Enter the cluster name: "
read cname
echo -n "Enter the region name: "
read rname

gcloud container clusters get-credentials $cname --region $rname &&

echo "\033[1;35;40mcluster credentials have been generated for $cname at region $rname.!!\033[0m"


read -p "Deploying jenkins app on kubernetes cluster, please enter to confirm!!" continue

kubectl apply --filename hello-k8s-deploy.yaml &&

echo "\033[1;35;40mJenkins using docker hub image,which have been deployed into kubernetes cluster $cname at region $rname.!!\033[0m"

read -p "Creating internal load balancer for all jenkins identical instances,please enter to confirm..." continue 
			
kubectl apply --filename hello-k8s-svc.yaml &&

echo "\033[1;35;40mNetwork service has been deployed into your kubernetes cluster $cname at region $rname.!!\033[0m"

kubectl get service &&

echo "\033[1;35;40mNetwork service has been deployed now and genreting the end point external ip of jenkins kubernetes cluster server $cname at region $rname.!!\033[0m"

sleep 8

kubectl get service

echo "\033[1;35;40mPlease note down the external ip and use it in browser to acccess the jenkins url http://EXTERNAL-IP:8080 \033[0m"

sleep 10

kubectl get service

echo "\033[1;35;40mRun the command <kubectl get service> again in case external ip still pending\033[0m"

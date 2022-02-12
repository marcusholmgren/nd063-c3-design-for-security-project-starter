.DEFAULT_GOAL := help

help:
		@echo "Please use 'make <target>' where <target> is one of"
		@echo ""
		@echo "  s3          1. Deploy the S3 buckets"
		@echo "  vpc         2. Deploy the VPC and Subnets"
		@echo "  app         3. Deploy the Application Stack"
		@echo ""
		@echo "Check the Makefile to know exactly what each target is doing."

s3:
	aws cloudformation create-stack --region us-east-1 --stack-name c3-s3 --template-body file://starter/c3-s3.yml

vpc:
	aws cloudformation create-stack --region us-east-1 --stack-name c3-vpc --template-body file://starter/c3-vpc.yml

app:
	aws cloudformation create-stack --region us-east-1 --stack-name c3-app --template-body file://starter/c3-app.yml --parameters ParameterKey=KeyPair,ParameterValue=udacity-project-3 --capabilities CAPABILITY_IAM

auto:
	echo "Checking for drift..."
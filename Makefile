AWS_ROLE = "arn:aws:iam::443332089211:role/daniel-gaskin-account"
SOURCE_LOCATION = ~/.bashrc
DOCKER_SERVERLESS = softinstigate/serverless
APP_DIR = /deploy
AWS_PROFILE = dg
AWS_ACCOUNT = 407674206889
AWS_REGION = eu-west-1

POWER_VALUES = ALL
NUM = 30
COUNT_NUMBER = 1000000
PARRLLEL = true
STRATEGY = cost
LAMBDA_NAME := docker run -v ~/.aws:/root/.aws amazon/aws-cli cloudformation describe-stack-resources --stack-name python-counter-dev --query 'StackResources[?LogicalResourceId==`PythonDashcounterLambdaFunction`].PhysicalResourceId' --output text --profile $(AWS_PROFILE)

auth:
	$(shell source $(SOURCE_LOCATION) && gsts --aws-role-arn $(AWS_ROLE) --profile contino-sso-sts)

app:
	docker run -v ~/.aws:/root/.aws -v $(shell pwd):$(APP_DIR) -w $(APP_DIR) -e AWS_PROFILE=$(AWS_PROFILE) $(DOCKER_SERVERLESS) deploy

config:
	$(shell ./cicd/scripts/generate-config.sh arn:aws:lambda:$(AWS_REGION):$(AWS_ACCOUNT):function:$(shell $(LAMBDA_NAME)) $(POWER_VALUES) $(NUM) $(COUNT_NUMBER) $(PARRLLEL) $(STRATEGY))

powertuner: 
	$(shell ./cicd/scripts/execute.sh)



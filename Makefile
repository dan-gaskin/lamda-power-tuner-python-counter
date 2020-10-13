AWS_ROLE = arn:aws:iam::443332089211:role/daniel-gaskin-account
SOURCE_LOCATION = ~/.bashrc
DOCKER_SERVERLESS = softinstigate/serverless
APP_DIR = /deploy
AWS_PROFILE = dg

.ONESHELL:

auth:
	$(shell source $(SOURCE_LOCATION) && gsts --aws-role-arn $(AWS_ROLE) --aws-profile contino-sso-sts)

app:
	docker run -v ~/.aws:/root/.aws -v $(shell pwd):$(APP_DIR) -w $(APP_DIR) -e AWS_PROFILE=$(AWS_PROFILE) $(DOCKER_SERVERLESS) deploy

powertuner: 
	$(shell cd aws-lambda-power-tuning && ./scripts/deploy.sh)

run: 
	$(shell cd aws-lambda-power-tuning && ./scripts/execute.sh)



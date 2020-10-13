## lamda-power-tuner-python-counter
This repo builds out a simple python Lambda function that counts in a loop.\
The purpose is to test out the open source AWS Lambda Power Tuner app -> https://github.com/alexcasalboni/aws-lambda-power-tuning

### Deployment
`make auth`
Make auth is run to login to AWS. Please update Makefile with appropriate credentials

`make app`
Make app is used to deploy the python lambda that we will be testing with the AWS Lambda Power Tuner app

`make powertuner`
Make powertuner is used to deploy the required resources to AWS to run the app - step functions, lambdas etc

`make config`
Make config creates the config file used by AWS Lambda Power Tuner

`make run`
Make run launches the AWS Lambda Power Tuner state machine using the config from make config.
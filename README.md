## lamda-power-tuner-python-counter
This repo builds out a simple python Lambda function that counts in a loop.\
The purpose is to test out the open source AWS Lambda Power Tuner app -> https://github.com/alexcasalboni/aws-lambda-power-tuning

### Pre-Reqs
* Deploy AWS Lambda Power Tuner, following https://github.com/alexcasalboni/aws-lambda-power-tuning
* To use `make auth` have the following in a location you can source
```
export GOOGLE_USERNAME=
export GOOGLE_SP_ID=
export GOOGLE_IDP_ID=
export AWS_REGION=
```
(Not necessary to run as long as you have valid credentials in ~/.aws)

### Deployment
`make auth`
Make auth is run to login to AWS. Please update Makefile with appropriate credentials

`make app`
Make app is used to deploy the python lambda that we will be testing with the AWS Lambda Power Tuner app

`make config`
Make config creates the config file used by AWS Lambda Power Tuner.

The output can be found at `./cicd/scipts/execution-input.json`

`make powertuner`
Make powertuner launches the AWS Lambda Power Tuner state machine using the config from make config.
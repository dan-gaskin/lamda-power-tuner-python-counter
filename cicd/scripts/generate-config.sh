#!/bin/bash
cat >cicd/scripts/execution-input.json << EOF
{
    "lambdaARN": "$1",
    "powerValues": "$2",
    "num": $3,
    "payload": {"count":$4},
    "parallelInvocation": $5,
    "strategy": "$6"
}
EOF
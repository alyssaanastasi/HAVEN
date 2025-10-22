#!/bin/bash

# Function to print a command and then evaluate it
run_cmd() {
    local cmd=$1
    echo "=> $cmd"
    eval $cmd
    echo ""
}

data_dir="HAVEN/output/raw/kuzmin/binary/haven"

######
# If running on docker
source /venv/docker_haven/bin/activate
####

echo ""
echo "1. Login to wandb"
echo "--------------------------------------------"
echo ""

# Install setuptools to get past distutils issue? 
run_cmd "pip install --upgrade setuptools"

run_cmd "export WANDB_API_KEY=9892595596b389b2400e1a3ae3bef9ee86cbf936"

run_cmd "wandb login"


echo ""
echo "2. Confirm Pip List"
echo "--------------------------------------------"
echo ""

run_cmd "pip list"
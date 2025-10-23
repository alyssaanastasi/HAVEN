#!/bin/bash

# Function to print a command and then evaluate it
run_cmd() {
    local cmd=$1
    echo "=> $cmd"
    eval $cmd
    echo ""
}

data_dir="output/raw/kuzmin/binary/haven"

######
# If running on docker
source activate haven
####

echo ""
echo "1. Login to wandb"
echo "--------------------------------------------"
echo ""

run_cmd "export WANDB_API_KEY=9892595596b389b2400e1a3ae3bef9ee86cbf936"
run_cmd "wandb login"

# Run model fine tuning
# top level HAVEN folder was transferred in .sub file
echo ""
echo "2. Fine tune base HAVEN model"
echo "--------------------------------------------"
echo ""

run_cmd "python HAVEN/src/run.py -c HAVEN/input/config-files/virus_host_prediction/kuzmin/fine-tuning-haven.yaml"

# Copy output files to staging
echo ""
echo "3. copy Output to Staging"
echo "--------------------------------------------"
echo ""

run_cmd "ls $data_dir"

# run_cmd "tar -czf $data_dir.tar.gz -C mgm/mgm/data $dir_name"

# run_cmd "ls mgm/mgm/data"
# run_cmd "ls $data_dir"

run_cmd "mv $data_dir /staging/aranastasi/HAVEN/outputs/"

# delete output from the job working directory
# run_cmd "rm -r $data_dir"

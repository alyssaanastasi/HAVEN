import os
import subprocess

viral_family_short_name = "sars_cov2"
# viral_family_long_name = "Middle_East_respiratory_syndrome_coronavirus"

bagged_model_types = ["BAGGED_3"] # "BAGGED_0", "BAGGED_1", "BAGGED_2", "BAGGED_3", "BAGGED_4"
num_reps = 5

# Local folders holding tar files to be transferred
local_folder = f"output"

# CHTC Staging folders
staging_folder = (
    f"aranastasi@ap2001.chtc.wisc.edu:/staging/aranastasi/HAVEN"
)

research_drive_folder = "/Volumes/mwcraven/Viral-Spillover-Project/CV_models"

# Move CV files -- CHTC to Research Drive
# Copy files locally then move to restricted research drive
## Make sure you are logged in to SMPH VPN & connected to research drive server
for model_type in bagged_model_types:
    for rep in range(1, num_reps + 1):
        subfolder_name = f"{viral_family_short_name}_{model_type}_rep{rep}"

        # Copy tar file locally from CHTC
        print(f"Command: scp {staging_folder}/{subfolder_name}.tar.gz {local_folder}/")

        subprocess.run(
            [
                "scp",
                f"{staging_folder}/{subfolder_name}.tar.gz",
                f"{local_folder}/",
            ]
        )

        # Move tar file to research drive
        print(f"mv {local_folder}/{subfolder_name}.tar.gz /Volumes/mwcraven/Viral-Spillover-Project/CV_models")

        subprocess.run(
            [
                "mv",
                f"{local_folder}/{subfolder_name}.tar.gz",
                f"/Volumes/mwcraven/Viral-Spillover-Project/CV_models",
            ]
        ) 

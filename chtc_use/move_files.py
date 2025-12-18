import os
import subprocess

num_reps = 5

# Local folders holding tar files to be transferred
local_folder = f"output"

# CHTC Staging folders
staging_folder = (
    f"aranastasi@ap2001.chtc.wisc.edu:/staging/aranastasi/HAVEN/outputs/LOOCV_reps"
)

research_drive_folder = "/Volumes/mwcraven/Viral-Spillover-Project/HAVEN/finetuning/LOOCV/"

# Move CV files -- CHTC to Research Drive
# Copy files locally then move to restricted research drive
## Make sure you are logged in to SMPH VPN & connected to research drive server
for rep in range(1, num_reps + 1):
    subfolder_name = f"kuzmin_LOOCV_fine_tuning_rep{rep}"

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
    print(f"mv {local_folder}/{subfolder_name}.tar.gz {research_drive_folder}")

    subprocess.run(
        [
            "mv",
            f"{local_folder}/{subfolder_name}.tar.gz",
            f"{research_drive_folder}",
        ]
    ) 

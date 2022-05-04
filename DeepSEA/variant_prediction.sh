#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=16gb
#SBATCH --time=48:00:00
#SBATCH -p gpu
#SBATCH --gres=gpu:v100:4
#SBATCH -A cphg-millerlab-vip
#SBATCH -o variant_prediction.out
#SBATCH --mail-type END
#SBATCH --mail-user dyl3pc@virginia.edu

export CUDA_VISIBLE_DEVICES=0,1,2,3
python3 -u /scratch/dyl3pc/adversarial_deepsea/selene/selene_sdk/cli.py variant_prediction.yml

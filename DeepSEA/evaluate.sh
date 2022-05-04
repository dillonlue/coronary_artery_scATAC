#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=20
#SBATCH --mem=32gb
#SBATCH --time=48:00:00
#SBATCH -p gpu
#SBATCH --gres=gpu:v100:4
#SBATCH -A cphg-millerlab-vip
#SBATCH -o evaluate.out
#SBATCH --mail-type END
#SBATCH --mail-user dyl3pc@virginia.edu

export CUDA_VISIBLE_DEVICES=0,1,2,3
python3 -u /scratch/dyl3pc/adversarial_deepsea/selene/selene_sdk/cli.py evaluate.yml --lr=0.1

#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=100gb
#SBATCH --time=48:00:00
#SBATCH --output="run_snakemake.out"
#SBATCH -p standard
#SBATCH -A cphg-millerlab-vip
#SBATCH --mail-type ALL
#SBATCH --mail-user dyl3pc@virginia.edu


#snakemake run_preprocess \
#    --conda-frontend conda \
#    -j 400 --nolock --cluster-config cluster.json --rerun-incomplete --keep-going \
#    --cluster "sbatch -A {cluster.account} -p {cluster.partition}  -c {cluster.ncpus} -n {cluster.ntasks}  -t {cluster.time} --mem {cluster.mem}" \
#    --jobname "BPNet.snakejob.{jobid}.sh" \

snakemake run_predict \
    --conda-frontend conda \
    -j 400 --nolock --cluster-config cluster_gpu.json --rerun-incomplete --keep-going \
    --cluster "sbatch -A {cluster.account} -p {cluster.partition}  -c {cluster.ncpus} -n {cluster.ntasks}  -t {cluster.time} --mem {cluster.mem} --gres {cluster.gres}" \
    --jobname "BPNet.snakejob.{jobid}.sh" \

./run_snakemake_train.slurm


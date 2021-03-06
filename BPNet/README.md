# Training BPNet

BPnet was trained using code from https://github.com/kundajelab/retina-models.

Before starting, `git clone git@github.com:kundajelab/retina-models.git` in this directory.

Inside the scripts folder, there is a Snakemake pipeline for preprocessing and training.

To rerun the pipeline:
1. run_snakemake_preprocess.slurm => preprocess the fragment and peak files and gets GC matched null regions
2. run_snakemake_train.slurm => train and evaluate model
3. run_snakemake_modisco.slurm => run modisco

Relevant rules in Snakemake:
1. train => trains BPNet model using code from the retina-models repository (above)
2. predicts => creates evaluation metrics of trained BPNet model using code from the retina-models repository (above)
3. interpret, modisco => creates the shap values in interpret and creates the modisco results and sequence logos in modisco

CAD variant predictions are performed in scripts/interpret_model/retina_notebooks/ScoreSNPs.ipynb.
Sequence logos are generated by scripts/interpret_model/retina_notebooks/Vignettes.ipynb.

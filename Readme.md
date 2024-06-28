# Reproducibility Report - Lars Christiansen
## On the Connection Between MPNN and Graph Transformer

Path to the notebook is .\report.ipynb
Path to the pdf id .\report.pdf

### Setup

To ensure that there are no dependency issues of all packages needed for this project, its recommended to create a new jupyter python kernel with a clean conda environment. This notebook is tested with cuda version 12.4 on my own machine.

```bash
conda create -n "env_paper_20"
conda activate env_paper_20 
conda install -c conda-forge ipykernel
python -m ipykernel install --user --name=kernel_paper_20
jupyter lab
```

Then you can start this notebook with the new kernel "kernel_paper_20" selected

Also a shell setup script is provided if preferred. Refer to 'experiment1/Readme.md' in this case.

### Execution

The models can be executed by running the notebook or alternatively by running 'experiment1/runAll.sh' as described in 'experiment1/Readme.md'.
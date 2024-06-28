#!/bin/bash

#
# run with "bash -i ./setup.sh"
#

conda activate env_paper_20

conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia
conda install pyg -c pyg 
conda install lightning -c conda-forge
conda install yacs ogb pandas scikit-learn performer-pytorch wandb
conda install openbabel fsspec rdkit -c conda-forge

pip install pyg_lib torch_scatter torch_sparse torch_cluster torch_spline_conv -f https://data.pyg.org/whl/torch-2.2.2+cu121.html
conda install -c dglteam/label/th22_cu121 dgl
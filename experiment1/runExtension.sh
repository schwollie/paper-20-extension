#!/bin/bash

conda activate env_paper_20

#MVN
python main.py --cfg configs/GatedGCN/MVN-peptides-func-GatedGCN.yaml  wandb.use False
python main.py --cfg configs/GatedGCN/MVN-peptides-func-GatedGCN+RWSE.yaml  wandb.use False

python main.py --cfg configs/GatedGCN/MVN-peptides-struct-GatedGCN.yaml  wandb.use False
python main.py --cfg configs/GatedGCN/MVN-peptides-struct-GatedGCN+RWSE.yaml  wandb.use False

python main.py --cfg configs/GCN/MNV-peptides-func-GCN.yaml  wandb.use False
python main.py --cfg configs/GCN/MVN-peptides-struct-GCN.yaml  wandb.use False

python main.py --cfg configs/GINE/MVN-peptides-func-GINE.yaml  wandb.use False
python main.py --cfg configs/GINE/MVN-peptides-struct-GINE.yaml  wandb.use False

#HSG
python main.py --cfg configs/GatedGCN/HSG-peptides-func-GatedGCN.yaml  wandb.use False
python main.py --cfg configs/GatedGCN/HSG-peptides-func-GatedGCN+RWSE.yaml  wandb.use False

python main.py --cfg configs/GatedGCN/HSG-peptides-struct-GatedGCN.yaml  wandb.use False
python main.py --cfg configs/GatedGCN/HSG-peptides-struct-GatedGCN+RWSE.yaml  wandb.use False

python main.py --cfg configs/GCN/HSG-peptides-func-GCN.yaml  wandb.use False
python main.py --cfg configs/GCN/HSG-peptides-struct-GCN.yaml  wandb.use False

python main.py --cfg configs/GINE/HSG-peptides-func-GINE.yaml  wandb.use False
python main.py --cfg configs/GINE/HSG-peptides-struct-GINE.yaml  wandb.use False


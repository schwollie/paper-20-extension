#!/bin/bash

conda activate env_paper_20

#MVN 5 nodes
python main.py --cfg configs/GatedGCN/MVN5-peptides-func-GatedGCN.yaml  wandb.use False
python main.py --cfg configs/GatedGCN/MVN5-peptides-func-GatedGCN+RWSE.yaml  wandb.use False

python main.py --cfg configs/GatedGCN/MVN5-peptides-struct-GatedGCN.yaml  wandb.use False
python main.py --cfg configs/GatedGCN/MVN5-peptides-struct-GatedGCN+RWSE.yaml  wandb.use False

python main.py --cfg configs/GCN/MNV5-peptides-func-GCN.yaml  wandb.use False
python main.py --cfg configs/GCN/MVN5-peptides-struct-GCN.yaml  wandb.use False

python main.py --cfg configs/GINE/MVN5-peptides-func-GINE.yaml  wandb.use False
python main.py --cfg configs/GINE/MVN5-peptides-struct-GINE.yaml  wandb.use False

#MVN 10 nodes
python main.py --cfg configs/GatedGCN/MVN10-peptides-func-GatedGCN.yaml  wandb.use False
python main.py --cfg configs/GatedGCN/MVN10-peptides-func-GatedGCN+RWSE.yaml  wandb.use False

python main.py --cfg configs/GatedGCN/MVN10-peptides-struct-GatedGCN.yaml  wandb.use False
python main.py --cfg configs/GatedGCN/MVN10-peptides-struct-GatedGCN+RWSE.yaml  wandb.use False

python main.py --cfg configs/GCN/MNV10-peptides-func-GCN.yaml  wandb.use False
python main.py --cfg configs/GCN/MVN10-peptides-struct-GCN.yaml  wandb.use False

python main.py --cfg configs/GINE/MVN10-peptides-func-GINE.yaml  wandb.use False
python main.py --cfg configs/GINE/MVN10-peptides-struct-GINE.yaml  wandb.use False

#HSG
python main.py --cfg configs/GatedGCN/HSG-peptides-func-GatedGCN.yaml  wandb.use False
python main.py --cfg configs/GatedGCN/HSG-peptides-func-GatedGCN+RWSE.yaml  wandb.use False

python main.py --cfg configs/GatedGCN/HSG-peptides-struct-GatedGCN.yaml  wandb.use False
python main.py --cfg configs/GatedGCN/HSG-peptides-struct-GatedGCN+RWSE.yaml  wandb.use False

python main.py --cfg configs/GCN/HSG-peptides-func-GCN.yaml  wandb.use False
python main.py --cfg configs/GCN/HSG-peptides-struct-GCN.yaml  wandb.use False

python main.py --cfg configs/GINE/HSG-peptides-func-GINE.yaml  wandb.use False
python main.py --cfg configs/GINE/HSG-peptides-struct-GINE.yaml  wandb.use False


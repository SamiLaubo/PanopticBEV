module load gcc/8.4.0-cuda python/3.7.7 cuda/11.1.1

CUDA_VISIBLE_DEVICES=0\
/home/laubo/DLAV/venv/panoptic_bev/bin/python -m torch.distributed.launch --nproc_per_node=1 --master_addr=$(hostname -I | cut -d ' ' -f 1) --master_port=$(python /home/laubo/DLAV/PanopticBEV/scripts/get_port.py) /home/laubo/DLAV/PanopticBEV/scripts/eval_panoptic_bev.py \
                                    --run_name=eval_1epoch \
                                    --project_root_dir=/home/laubo/DLAV/PanopticBEV \
                                    --seam_root_dir=/home/laubo/DLAV/nuscenes/nuScenes_panopticbev\ \
                                    --dataset_root_dir=/work/scitas-share/datasets/Vita/civil-459/NuScenes_full/US \
                                    --mode=test \
                                    --test_dataset=nuScenes \
                                    --resume=/home/laubo/DLAV/PanopticBEV/experiments/bev_train_run12/saved_models/model_best.pth \
                                    --config=nuscenes.ini \

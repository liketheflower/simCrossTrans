# Test swin with intertrans
for prob in 80 60 40 20
do
echo ${prob}
cfg=configs/swin/mask_rcnn_swin-t-p4-w7_fpn_ms-crop-3x_coco_mask${prob}.py
echo ${cfg}
checkpoint=/data/sophia/a/Xiaoke.Shen54/repos/RGB2PC/work_dirs/mask_rcnn_swin-t-p4-w7_fpn_ms-crop-3x_coco_load_from/epoch_100.pth
python tools/test.py  ${cfg} ${checkpoint} --eval=bbox  > ./test_logs_unshow/mask_res/test_swin_with_intertrans_at_epoch100_unshow_mask${prob}.log


# Test resnet with intertrans
cfg=configs/mask_rcnn/mask_rcnn_r50_fpn_mstrain-poly_3x_coco_mask${prob}.py                        
echo ${cfg}
checkpoint=/data/sophia/a/Xiaoke.Shen54/repos/RGB2PC/work_dirs/mask_rcnn_r50_fpn_mstrain-poly_3x_coco/epoch_100.pth
python tools/test.py  ${cfg} ${checkpoint} --eval=bbox  > ./test_logs_unshow/mask_res/test_resnet_with_intertrans_at_epoch100_unshow_mask${prob}.log
done

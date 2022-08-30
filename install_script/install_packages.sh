#python -m pip install torch==1.10 torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu113
conda install pytorch==1.10 torchvision torchaudio cudatoolkit=11.3 -c pytorch
wget https://github.com/open-mmlab/mmdetection/archive/refs/tags/v2.18.1.tar.gz
tar xvf v2.18.1.tar.gz
cd mmdetection-2.18.1
python -m pip install -r requirements/build.txt
python -m pip install "git+https://github.com/open-mmlab/cocoapi.git#subdirectory=pycocotools"
python -m pip install -v -e .

python -m pip install mmcv-full==1.3.18 -f https://download.openmmlab.com/mmcv/dist/cu113/torch1.10.0/index.html

apt-get update
apt-get install -y build-essential cmake pkg-config make
apt-get install -y libjpeg-dev libtiff5-dev libpng-dev libavcodec-dev libavformat-dev
apt-get install -y libswscale-dev libxvidcore-dev libx264-dev libxine2-dev libv4l-dev
apt-get install -y v4l-utils libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
apt-get install -y libgtk2.0-dev mesa-utils libgl1-mesa-dri libgtkgl2.0-dev
apt-get install -y libgtkglext1-dev libatlas-base-dev gfortran libeigen3-dev
apt-get install -y unzip

mkdir opencv
cd opencv
wget -O opencv.zip https://github.com/opencv/opencv/archive/4.5.3.zip
unzip opencv.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.5.3.zip
unzip opencv_contrib.zip
cd opencv-4.5.3 
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D WITH_TBB=OFF \
-D WITH_IPP=OFF \
-D WITH_1394=OFF \
-D BUILD_WITH_DEBUG_INFO=OFF \
-D BUILD_DOCS=OFF \
-D INSTALL_C_EXAMPLES=ON \
-D INSTALL_PYTHON_EXAMPLES=ON \
-D BUILD_EXAMPLES=OFF \
-D BUILD_TESTS=OFF \
-D BUILD_PERF_TESTS=OFF \
-D WITH_QT=OFF \
-D WITH_GTK=ON \
-D WITH_OPENGL=ON \
-D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.5.3/modules \
-D WITH_V4L=ON \
-D WITH_FFMPEG=ON \
-D WITH_XINE=ON \
-D BUILD_NEW_PYTHON_SUPPORT=ON \
-D OPENCV_GENERATE_PKGCONFIG=ON \
-D PYTHON3_EXECUTABLE=/opt/conda/envs/operation/bin/python \
-D PYTHON3_INCLUDE_DIR=/opt/conda/envs/operation/include/python3.8 \
-D PYTHON3_NUMPY_INCLUDE_DIRS=/opt/conda/envs/operation/lib/python3.8/site-packages/numpy/core/include \
-D PYTHON3_PACKAGES_PATH=/opt/conda/envs/operation/lib/python3.8/site-packages \
-D PYTHON3_LIBRARY=/opt/conda/envs/operation/lib/libpython3.8.so \
-D BUILD_NEW_PYTHON_SUPPORT=ON \
-D BUILD_opencv_python3=ON \
-D HAVE_opencv_python3=ON \
../

make -j 4
make install
make clean

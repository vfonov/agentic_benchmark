#! /bin/bash

pfx=$1

if [[ -z $pfx ]];then
    echo "Usage: $0 <output_prefix>"
    echo "Will create an input directory for agent to run in"
    exit 1
fi

if [[ -e $pfx/.git ]];then
    echo "Output directory $pfx already exists, and initialize"
    exit 1
fi

git init $pfx
cp -uv TASK.md AGENTS.md   brain.nii.gz  sphere_cube.nii.gz  sphere.nii.gz $pfx
mkdir -p $pfx/nifti
tar zxf nifti.tar.gz -C $pfx/nifti/

cd $pfx

git add README.md AGENTS.md   brain.nii.gz  sphere_cube.nii.gz  sphere.nii.gz
git commit -m "Initial commit with sample data and documentation"
git add nifti
git commit -m "Added nifti library"
git subtree add --prefix libigl https://github.com/libigl/libigl.git main --squash
# put libigl and nifti into target directory
git commit -m "Add libigl as a subtree and nifti as a submodule"




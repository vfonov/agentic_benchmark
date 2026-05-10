#! /bin/bash

# code to generate sample data for testing visualization 


# a sphere, all voxels have value of 1 or 0. Label 1 correpond to the sphere, input file sphere.nii.gz , 
# dimensions: 50x50x50voxels, voxel size is 2x2x2mm sphere is approximately 50mm in diameter

make_phantom -center 0 0 0 -ellipse -width 55 40 30 -no_partial -nelements 50 50 50 -step 2 2 2 -start -50 -50 -50 -byte -labels  sphere.mnc -clob

# a sphere and a cube, input file  sphere_cube.nii.gz  Sphere has voxels of value 1, cube has voxels of value 2, input file sphere_cube.nii.gz

make_phantom -center 0 0 0 -ellipse -width 30 30 30 -no_partial -nelements 50 50 50 -step 2 2 2 -start -50 -50 -50 -byte -labels  sphere_2.mnc -clob
make_phantom -center 0 -25 0 -rectangle -width 50 50 50 -no_partial -nelements 50 50 50 -step 2 2 2 -start -50 -50 -50 -byte -labels  -fill_value 2 -edge_value 2 cube_2.mnc -clob
minccalc -byte -labels -express 'A[0]>0?1:A[1]>0?2:0' sphere_2.mnc cube_2.mnc sphere_cube.mnc -clob


mnc2nii sphere.mnc sphere.nii
gzip -f -9 sphere.nii
mnc2nii  sphere_cube.mnc sphere_cube.nii
gzip -f -9 sphere_cube.nii


rm -f sphere.mnc cube_2.mnc sphere_2.mnc


# brain anatomy, input file brain.nii.gz Gray matter label 2, white matter label 3, hippocampus label 4

minccalc -byte -labels -express 'abs(A[0]-16)<0.5||abs(A[0]-29)<0.5? 4:abs(A[0]-7)<0.5||abs(A[0]-20)<0.5||abs(A[0]-10)<0.5||abs(A[0]-23)<0.5 ? 3 : abs(A[0]-8)<0.5||abs(A[0]-21)<0.5||abs(A[0]-11)<0.5||abs(A[0]-24)<0.5? 2: 0' \
    t1w_synthseg.mnc brain.mnc

mnc2nii brain.mnc brain.nii
gzip -f -9 brain.nii
rm -f brain.mnc


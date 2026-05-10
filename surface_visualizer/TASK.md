# Visualization complex surfaces extracted from a 3D voxelated volume

## Task

- given a 3D volume in nifti format, with voxels containing discrete values extract surfaces 
  corresponding to the boundaries between non-zero values
- each surface will be given a color and transparency (RGBA format)
- additionally there will be a cut plane specified per surface, corresponding to the dicrete value it was extracted from
- the program is supposed to generate a 3D rendering view for an observer outside of the volume, looking at the center of volume
  using perspective projection. View should be standardized so that the field of view covers the whole volume. 
- The cut plane specification will be a normal vector and distance from the volume center. It will cut-away part of the surfece between the plane and the viewer
  to be able to see internal strucures
- if a structure is semitransparent (i.e alpha is below 1.0, underlying structures should be visible underneath)
- the program will work in a sandboxed environment without OpenGL or GPU rendering, all rendering have to be done without relying on using any external services such as  X11 or Windows services
- user will specify all input parameters via command line interface
- output will be placed in a .png file
- results should be reproducible 
- ray-tracing is a preferrable method

## Program requirements

- It should be written in C or C++

## Example data

- example 1: a sphere, all voxels have value of 1 or 0. Label 1 correpond to the sphere, input file sphere.nii.gz , dimensions: 50x50x50voxels, voxel size is 2x2x2mm sphere is approximately 50mm in diameter. Color of sphere should be (R,G,B,A) 0.7,0.7,0.7,1.0 
- example 2: a sphere and a cube, input file  sphere_cube.nii.gz  Sphere has voxels of value 1, cube has voxels of value 2, input file sphere_cube.nii.gz. Color of sphere should be (R,G,B,A) 0.8,0.5,0.5,1.0 color of the cube is 0.4,0.4,0.8,0.3
- example 3: brain anatomy, input file brain.nii.gz Gray matter label 2, white matter label 3, hippocampus label 4. Colors, by label id:   2: 0.7,0.7,0.7,0.2 3: 0.8,0.8,0.8,0.3 4: 0.9,0.2,0.2,1.0 Make a cut plane passing through (0,0,0) with normal (0.5,0.5,0.5) 

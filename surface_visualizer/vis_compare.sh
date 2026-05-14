#! /bin/bash



# claude_sonnet/sphere_cube.png
# opencode_MiMo-v2.5-Q3/sphere_cube_MiMo_v2.5.png
# opencode_qwen_3.5_351B/sphere_cube.png
# opencode_qwen_3.5_351B/sphere_cube_qwen_3.5_395B_mk3.png
# opencode_qwen_3.6/sphere_cube.png


montage -tile 1x1 -geometry 512x512+10+10 -pointsize 20 -gravity north -fill black \
  -label "Expected rendering (ITKSNAP)" sphere_cube_itksnap.png\
   sphere_cube_itksnap_title.png

montage -tile 2x2 -geometry 512x512+10+10 -pointsize 20  -fill black \
  -label "Claude Sonnet"  claude_sonnet/sphere_cube.png \
  -label "QWEN 3.6 35B"   opencode_qwen_3.6/sphere_cube.png \
  -label "QWEN 3.5 397B"  opencode_qwen_3.5_351B/sphere_cube.png  \
  -label "MiMo v2.5"      opencode_MiMo-v2.5-Q3/sphere_cube_MiMo_v2.5.png \
   sphere_cube_results_all_.png


montage -tile 1x2 -geometry +0+0 \
  sphere_cube_itksnap_title.png \
  sphere_cube_results_all_.png \
  sphere_cube_results_all.png
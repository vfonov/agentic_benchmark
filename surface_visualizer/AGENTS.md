# AGENTS.md — Agent Operating Guide

This is the single authoritative reference for AI agents working in this repository.
Read this file before making any changes.


---

## 1. Repository Overview

**Documentation:**
`README.md` - task description, read when starting the project

**Input files:**
`brain.nii.gz`  `sphere_cube.nii.gz`  `sphere.nii.gz` - example input files

**Dependencies:**
## External 


## Build & Test

```bash
cd build
cmake ..
make -j$(nproc)
ctest --output-on-failure
```

## Architecture Notes

Use C++ , and cmake for building. You can use libigl library for 3D objects manipulations and rendering, beware there is no X11 or OpenGL available 

## Workflow Rules

1. **Read before writing** — read the full function you are modifying; check `CMakeLists.txt` for dependencies
2. **Do not download scrips without permission** - if you need something, ask user
3. **Permissions** - you are running inside of a container with standard user permissions, do not try to change the system or install new packages
4. **Compile after every change** — `make` must succeed before moving on
5. **Run tests** — if modifying logic, run `ctest --output-on-failure`
6. **No reformatting** — follow the existing style of the file you are editing; do not reformat unrelated lines
7. **Lint only what you touch** — `cppcheck` or `clang-tidy` on changed files only
8. **Use LSP for code search** — prefer the LSP tool (go-to-definition, find-references, hover) over `grep`/`rg` when searching for symbols, definitions
9. **No absolute paths in source code** — all paths must be relative to the current directory or passed as command-line arguments. Use `CMAKE_CURRENT_SOURCE_DIR` in CMakeLists.txt for test data paths

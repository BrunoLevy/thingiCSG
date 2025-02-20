# thingiCSG
A collection of interesting files for testing CSG engines in OpenSCAD file format.

To checkout thingyCSG with all submodules (BOSL2):
```
git clone --recurse-submodules https://github.com/BrunoLevy/thingiCSG.git
```

# BOSL2
[BOSL2](https://github.com/BelfrySCAD/BOSL2) is included as a
submodule. It has interesting and challenging test cases. 

To use the demos, you will need to have BOSL2 in the openscad path.
For instance, you can do:
```
cd BOSL2/examples
ln -s ../ BOSL2
openscad BOSL2logo.scad -o out.stl 
```
(or `computeCSG BOSL2logo.scad` if you use geogram)
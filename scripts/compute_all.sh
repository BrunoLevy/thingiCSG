#!/bin/sh

sources=""
engine="geogram"

usage()
{
cat <<END
Usage: compute_all.sh -engine [geogram | CGAL | manifold] -i inputfile(s)
END
}


while [ -n "$1" ]; do

    case "$1" in
       -engine)
          shift
	  engine=$1
	  shift
	  ;;

       -i)
          shift
	  while [ -n "$1" ]; do
	     sources="$sources $1"
	     shift
	  done
	  ;;

        -h)
	  shift
	  usage
	  ;;

        *)
          echo "Error: unrecognized option: $1"
	  usage
          return 1
          ;;

    esac
done    

case "$engine" in
   geogram)
      command="compute_CSG"
#     flags='coplanar_angle=0.1'
      flags=""
      extension=".geogram"
      args=""
      ;;
      
   CGAL)
      command="openscad"
      flags=""
      extension=".stl"
      args="-o"
      ;;
      
   coref*)
      engine="corefinement"
      command="openscad++"
      flags="--enable fast-csg-trust-corefinement"
      extension=".stl"
      args="-o"
      ;;

   manifold)
      command="openscad++"
      flags="--enable manifold"
      extension=".stl"
      args="-o"
      ;;

   *)
      echo "Error: unrecognized engine: $engine"
      usage
      return 1
      ;;
esac

echo "input  :" $sources
echo "engine :" $engine

for input in $sources
do
   echo
   echo "Processing >>>" $input "<<<"
   $command $flags $input $args `basename $input .scad`$extension
done

#!/usr/bin/env bash

mkdir -p out/$1
mkdir -p out/$1/SVG/
mkdir -p out/$1/PNG/
mkdir -p out/$1/PDF/

file=$(cat replacements.csv)

for line in $file
do
	cat template.svg | sed 's/LABEL/'$1'x'$line'/' > out/$1/SVG/$1x$line.svg
	inkscape --export-type="png" --export-filename='out/'$1'/PNG/'$1'x'$line'.png' --export-dpi=1200 out/$1/SVG/$1x$line.svg
	inkscape --export-type="pdf" --export-filename='out/'$1'/PDF/'$1'x'$line'.pdf' --export-dpi=1200 out/$1/SVG/$1x$line.svg
done

# cat template.svg | sed "s/LABEL/M3x6/" > out/$1/SVG/$1x6.svg

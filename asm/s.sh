#!/bin/bash

for dir in */; do
  if [ -d "$dir" ]; then
    echo "enter dir: $dir"
    cd "$dir" || continue
    make clean
    cd ..
  fi
done

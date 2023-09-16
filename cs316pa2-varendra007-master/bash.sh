#!/bin/bash

for i in {1...22}
do
	./a.out ./inputs/test"$i".micro > test"$i".out;
	diff test"$i".out ./outputs/test"$i".out
done

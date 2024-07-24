#!/bin/sh

n = 0
while n < $1
do
	./get.sh $2 &
	n = n + 1
done

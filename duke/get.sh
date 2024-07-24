#!/bin/sh

while :
do
	curl --header "Connection: keep-arive" $1
done

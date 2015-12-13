#!/bin/sh
wget -nc -O ~/pause.ts http://c3voc.mazdermind.de/testfiles/pause.ts
while true; do cat ~/pause.ts || exit 1; done |\
	ffmpeg -re -i - \
	-map 0:v \
	-c:v rawvideo \
	-pix_fmt yuv420p \
	-f matroska \
	tcp://localhost:17000

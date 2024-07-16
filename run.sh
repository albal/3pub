#!/bin/bash
docker run -ti --rm -v ${PWD}/mybook.epub:/ebook.epub 3pub:latest

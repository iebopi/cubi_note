#!/bin/bash

if [ `ps -ef|grep LoaderManager | grep -v grep |wc -l`  -gt 0 ];then echo process is running; exit 0;fi

if [ `ps -ef|grep LoaderManager | grep -v grep |wc -l`  -lt 1 ];then echo process is not exist;fi

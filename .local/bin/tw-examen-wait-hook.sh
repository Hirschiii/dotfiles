#!/bin/env bash

# date -d "$1 - 14 days" +%Y-%m-%d

DATE=$(task $1 export | grep -Po '"due":.*?[^\\]",' | perl -pe 's/"due"://; s/^"//; s/",$//' | cut -c1-8)

date -d "$DATE - 14 days" +%Y-%m-%d

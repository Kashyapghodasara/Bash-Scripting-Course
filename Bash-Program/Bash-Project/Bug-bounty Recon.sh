#!/bin/bash

# Project 4 - Bug Bounty Reconnaissance

# 1. Documentation
# 2. Subdomain Enumuration
# 3. Sorting and Filtering
# 4. Resolve Subdomain/target
# 5. Directory brute-forcing/fuzzing

## --- Step 1 ---

target=$1

if [[ ! -d $target ]]
then
	mkdir $target
fi

cd $target

## --- Step 2 ---
# Tools for Subdomain = Asset Finder, Sub Lister
# Subwalker => Wrapper of 3 diff. tools (SubScraper, Sublist3r, AssetFinder)


echo "====== Finding Subdomains with Sublister3r ======"

python3 /home/kali/setup-tools/subwalker/tools/Sublist3r/sublist3r.py -d $target -t 25 -o subdomains.txt


# Binary

echo "====== Finding Subdomains with Asset Finder ======"
/home/kali/setup-tools/subwalker/tools/assetfinder/assetfinder -subs-only $target >> subdomains.txt


## --- Step 3 ---
# Sorting and Filtering to reduce duplicate value

echo "====== Sorting and Filtering Output ======"
sort -u subdomains.txt > subdomains

# uniq => sometimes both tools finds same domains, so remove duplicate domain display only unique one.

## --- Step 4 ---
# Resolving Subdomain and Target
echo "====== Finding Live Subdomains with httprobe ======"
cat subdomains | httprobe > alive.txt


# Javascript File Enumuration - Analization
echo "====== Finding JS files ======"
cat alive.txt | subjs > jsfiles


# Subjack => Find Takeover
echo "====== Finding Takeovers for subdomains ======"
subjack -w subdomains -t 25 -ssl -o takeovers.txt

## --- Step 5 ---
# Directory Busting

# dirsearch missing some extra pkgs. which causes some errors so we install the pkgs. in virtual env. directly run the dirsearch in venv.

echo "====== Fuzzing Directory ======"

while read -r line
do
    /home/kali/setup-tools/dirsearch/venv/bin/python \
        /home/kali/setup-tools/dirsearch/dirsearch.py \
        -u "$line" \
        -w /home/kali/setup-tools/wordlists/comman.txt \
        -o directory_fuzzing.txt
done < alive.txt


echo ":::::::::: D O N E ::::::::::"











#! /bin/bash

# Test script that sets environmental variables, then launches the dir-index.cgi script
# Original script at: https://gist.github.com/jow-/743363c332d09cb58a60dd1f216b6ee4

# Script writes the several files into the top-level directory of the repo
#
# 1) targets.html shows the "targets" directory 
# 2) directory.html displays a standard (non "target") directory
# 3) 404.html shows the "Page not found"
# 4) output.json shows the output of the generated JSON file

# Open the pages in a browser and reload after each run

# To run:
#   cd <main directory of repo>
#   sh test.sh 

# Display a "target" directory with OpenWrt firmware binary files
# 
export DOCUMENT_ROOT="./test/"                          # becomes $phys
export PATH_INFO="releases/21.02.0/targets/ath79/generic/"   # becomes $virt

perl dir-index.cgi > targets.html

# Display a simple directory listing 
# 
export DOCUMENT_ROOT="./"                          	# becomes $phys
export PATH_INFO="./"   							# becomes $virt

perl dir-index.cgi > directory.html

# Display 404 page
# 
export DOCUMENT_ROOT="./glorph"                          		# becomes $phys
export PATH_INFO="releases/21.02.0/targets/ath79/generic/"   	# becomes $virt

perl dir-index.cgi > 404.html

# Display JSON output
# 
export DOCUMENT_ROOT="./test"                          	# becomes $phys
export PATH_INFO="releases/21.02.0/targets/"   					# becomes $virt
export QUERY_STRING="json"

perl dir-index.cgi > output.json


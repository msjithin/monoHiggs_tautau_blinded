set -e

sh copyFiles.sh
sh hadd_files.sh


cd plotting_script

python main.py -idx 32 -ch etau

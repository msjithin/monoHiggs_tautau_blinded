import os
import re

tmpfile = "signal_dir_list"
os.popen('ls -d /hdfs/store/user/jmadhusu/Signal_Zpbaryonic2017_Apr22/*/*/*/* > '+tmpfile)
inputFile=open(tmpfile, "r")
outFile = open("do_skim_signal.sh", "w")
outFile.write("""
./rootcom skimm_signal_2017 analyze_signal
outDir="Out_Signal_$(date +"%d-%m-%Y_%H-%M")" 
mkdir $outDir 

""")


writeString = """
./MakeCondorFiles.csh analyze_signal {inputdir}/ {outputfile}.root -1 1000 2017 MC {outputfile} $outDir 
"""

for line in inputFile:
    line = line.strip()
    sample = 'Signal_Zpbaryonic2017_' + line.split('/')[-1][-2:]
    print sample
    outFile.write(writeString.format(inputdir=line, outputfile=sample))

inputFile.close()
outFile.close()
print """
created do_skim_signal.sh
do 
  bash do_skim_signal.sh
in /nfs_scratch/ directory with required files
"""

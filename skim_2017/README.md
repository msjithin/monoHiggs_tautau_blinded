


# Skiming the ntuples

To skim the ntuples, cd to the channel directory
 use step0.py file to generate submit scripts for all ntuples (change the /hdfs/ path in the .py file)

To submit to condor use the generated file.


Skiming is done by a .C and .h file. 
For instance etau/skimm_et_2017.C and etau/skimm_et_2017.h for etau

skimming_Htt() function checks for etau/mutau/tauatau passing loose selections.
It is defined in .C file.
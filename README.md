# monoHiggs_tautau blinded

Each channel is kept in its own directory in the years

All scripts are kept in 'src' directory in the channels folder.


To run the jobs locally, check runAnalyzer.sh

To submit on condor, check submit.sh


To run postanalyzer, 
cd blinded_2017/etau/postanalyzer/
 and run `bash execute_all.sh`

All scripts are run through main.py in blinded_2017/etau/postanalyzer/plotting/

### Note :  this can be common for all 3 channels
Usage : python main.py -idx 2,3,4 -ch etau"

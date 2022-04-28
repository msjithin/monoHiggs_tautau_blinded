
./rootcom skimm_signal_2017 analyze_signal
outDir="Out_Signal_$(date +"%d-%m-%Y_%H-%M")" 
mkdir $outDir 


./MakeCondorFiles.csh analyze_signal root://cmsxrootd.hep.wisc.edu//store/user/jmadhusu/Signal_Zpbaryonic2017_Apr22/MonoHToTauTau_ZpBaryonic_TuneCP2_13TeV_madgraph-pythia8/crab_job_MonoHToTauTau_ZpBaryonic_2017/220427_152646/0000/ Signal_Zpbaryonic2017_00.root -1 1000 2017 MC Signal_Zpbaryonic2017_00 $outDir 


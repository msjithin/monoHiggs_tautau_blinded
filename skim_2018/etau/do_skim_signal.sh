
./rootcom skimm_signal_2018 analyze_signal
outDir="Out_Signal_$(date +"%d-%m-%Y_%H-%M")" 
mkdir $outDir 


./MakeCondorFiles.csh analyze_signal root://cmsxrootd.hep.wisc.edu//store/user/jmadhusu/Signal_Zpbaryonic2018_Apr2022/MonoHToTauTau_ZpBaryonic_TuneCP2_13TeV_madgraph-pythia8/crab_job_MonoHToTauTau_ZpBaryonic_2018/220427_134433/0000/ Signal_Zpbaryonic2018_00.root -1 1000 2018 MC Signal_Zpbaryonic2018_00 $outDir 

./MakeCondorFiles.csh analyze_signal root://cmsxrootd.hep.wisc.edu//store/user/jmadhusu/Signal_Zpbaryonic2018_Apr2022/MonoHToTauTau_ZpBaryonic_TuneCP2_13TeV_madgraph-pythia8/crab_job_MonoHToTauTau_ZpBaryonic_2018/220427_134433/0001/ Signal_Zpbaryonic2018_01.root -1 1000 2018 MC Signal_Zpbaryonic2018_01 $outDir 

./MakeCondorFiles.csh analyze_signal root://cmsxrootd.hep.wisc.edu//store/user/jmadhusu/Signal_Zpbaryonic2018_Apr2022/MonoHToTauTau_ZpBaryonic_TuneCP2_13TeV_madgraph-pythia8/crab_job_MonoHToTauTau_ZpBaryonic_2018/220427_134433/0002/ Signal_Zpbaryonic2018_02.root -1 1000 2018 MC Signal_Zpbaryonic2018_02 $outDir 

./MakeCondorFiles.csh analyze_signal root://cmsxrootd.hep.wisc.edu//store/user/jmadhusu/Signal_Zpbaryonic2018_Apr2022/MonoHToTauTau_ZpBaryonic_TuneCP2_13TeV_madgraph-pythia8/crab_job_MonoHToTauTau_ZpBaryonic_2018/220427_134433/0003/ Signal_Zpbaryonic2018_03.root -1 1000 2018 MC Signal_Zpbaryonic2018_03 $outDir 

./MakeCondorFiles.csh analyze_signal root://cmsxrootd.hep.wisc.edu//store/user/jmadhusu/Signal_Zpbaryonic2018_Apr2022/MonoHToTauTau_ZpBaryonic_TuneCP2_13TeV_madgraph-pythia8/crab_job_MonoHToTauTau_ZpBaryonic_2018/220427_134433/0004/ Signal_Zpbaryonic2018_04.root -1 1000 2018 MC Signal_Zpbaryonic2018_04 $outDir 

./MakeCondorFiles.csh analyze_signal root://cmsxrootd.hep.wisc.edu//store/user/jmadhusu/Signal_Zpbaryonic2018_Apr2022/MonoHToTauTau_ZpBaryonic_TuneCP2_13TeV_madgraph-pythia8/crab_job_MonoHToTauTau_ZpBaryonic_2018/220427_134433/0005/ Signal_Zpbaryonic2018_05.root -1 1000 2018 MC Signal_Zpbaryonic2018_05 $outDir 

./MakeCondorFiles.csh analyze_signal root://cmsxrootd.hep.wisc.edu//store/user/jmadhusu/Signal_Zpbaryonic2018_Apr2022/MonoHToTauTau_ZpBaryonic_TuneCP2_13TeV_madgraph-pythia8/crab_job_MonoHToTauTau_ZpBaryonic_2018/220427_134433/0006/ Signal_Zpbaryonic2018_06.root -1 1000 2018 MC Signal_Zpbaryonic2018_06 $outDir 

./MakeCondorFiles.csh analyze_signal root://cmsxrootd.hep.wisc.edu//store/user/jmadhusu/Signal_Zpbaryonic2018_Apr2022/MonoHToTauTau_ZpBaryonic_TuneCP2_13TeV_madgraph-pythia8/crab_job_MonoHToTauTau_ZpBaryonic_2018/220427_134433/0007/ Signal_Zpbaryonic2018_07.root -1 1000 2018 MC Signal_Zpbaryonic2018_07 $outDir 

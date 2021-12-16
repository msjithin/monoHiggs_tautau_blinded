
outDir="Out_$(date +"%d-%m-%Y_%H-%M")" 
mkdir $outDir 

###########################   MC  #########################

./rootcom mutau_analyzer analyze_mutau  


./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/DY1JetsToLL_00.root DY1JetsToLL_00.root -1 1000 2018 MC DY1JetsToLL_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/DY1JetsToLL_01.root DY1JetsToLL_01.root -1 1000 2018 MC DY1JetsToLL_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/DY1JetsToLL_02.root DY1JetsToLL_02.root -1 1000 2018 MC DY1JetsToLL_02 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/DY1JetsToLL_03.root DY1JetsToLL_03.root -1 1000 2018 MC DY1JetsToLL_03 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/DY1JetsToLL_04.root DY1JetsToLL_04.root -1 1000 2018 MC DY1JetsToLL_04 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/DY2JetsToLL_00.root DY2JetsToLL_00.root -1 1000 2018 MC DY2JetsToLL_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/DY2JetsToLL_01.root DY2JetsToLL_01.root -1 1000 2018 MC DY2JetsToLL_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/DY2JetsToLL_02.root DY2JetsToLL_02.root -1 1000 2018 MC DY2JetsToLL_02 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/DY3JetsToLL_00.root DY3JetsToLL_00.root -1 1000 2018 MC DY3JetsToLL_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/DY4JetsToLL_00.root DY4JetsToLL_00.root -1 1000 2018 MC DY4JetsToLL_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/DYJetsToLL_00.root DYJetsToLL_00.root -1 1000 2018 MC DYJetsToLL_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/DYJetsToLL_00.root DYJetsToLL_Incl_HT_00.root -1 1000 2018 MC DYJetsToLL_Incl_HT_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/DYJetsToLL_01.root DYJetsToLL_01.root -1 1000 2018 MC DYJetsToLL_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/DYJetsToLL_01.root DYJetsToLL_Incl_HT_01.root -1 1000 2018 MC DYJetsToLL_Incl_HT_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/DYJetsToLL_02.root DYJetsToLL_02.root -1 1000 2018 MC DYJetsToLL_02 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/DYJetsToLL_03.root DYJetsToLL_03.root -1 1000 2018 MC DYJetsToLL_03 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/DYJetsToLL_04.root DYJetsToLL_04.root -1 1000 2018 MC DYJetsToLL_04 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/DYJetsToLL_05.root DYJetsToLL_05.root -1 1000 2018 MC DYJetsToLL_05 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/DYJetsToLL_06.root DYJetsToLL_06.root -1 1000 2018 MC DYJetsToLL_06 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/DYJetsToLL_M10to50_00.root DYJetsToLL_M10to50_00.root -1 1000 2018 MC DYJetsToLL_M10to50_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/DYJetsToLL_M10to50_01.root DYJetsToLL_M10to50_01.root -1 1000 2018 MC DYJetsToLL_M10to50_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/DYJetsToLL_M10to50_02.root DYJetsToLL_M10to50_02.root -1 1000 2018 MC DYJetsToLL_M10to50_02 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/DYJetsToLL_M10to50_03.root DYJetsToLL_M10to50_03.root -1 1000 2018 MC DYJetsToLL_M10to50_03 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/EWKWMinus2Jets_WToLNu_00.root EWKWMinus2Jets_WToLNu_00.root -1 1000 2018 MC EWKWMinus2Jets_WToLNu_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/EWKWPlus2Jets_WToLNu_00.root EWKWPlus2Jets_WToLNu_00.root -1 1000 2018 MC EWKWPlus2Jets_WToLNu_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/EWKZ2Jets_ZToLL_00.root EWKZ2Jets_ZToLL_00.root -1 1000 2018 MC EWKZ2Jets_ZToLL_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/EWKZ2Jets_ZToNuNu_00.root EWKZ2Jets_ZToNuNu_00.root -1 1000 2018 MC EWKZ2Jets_ZToNuNu_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/GluGluHToTauTau_00.root GluGluHToTauTau_00.root -1 1000 2018 MC GluGluHToTauTau_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/GluGluHToTauTau_01.root GluGluHToTauTau_01.root -1 1000 2018 MC GluGluHToTauTau_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/GluGluZH_HToWW_00.root GluGluZH_HToWW_00.root -1 1000 2018 MC GluGluZH_HToWW_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/HWminusJ_HToWW_00.root HWminusJ_HToWW_00.root -1 1000 2018 MC HWminusJ_HToWW_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/HWplusJ_HToWW_00.root HWplusJ_HToWW_00.root -1 1000 2018 MC HWplusJ_HToWW_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ST_t-channel_antitop_00.root ST_t-channel_antitop_00.root -1 1000 2018 MC ST_t-channel_antitop_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ST_t-channel_antitop_01.root ST_t-channel_antitop_01.root -1 1000 2018 MC ST_t-channel_antitop_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ST_t-channel_antitop_02.root ST_t-channel_antitop_02.root -1 1000 2018 MC ST_t-channel_antitop_02 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ST_t-channel_antitop_03.root ST_t-channel_antitop_03.root -1 1000 2018 MC ST_t-channel_antitop_03 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ST_t-channel_antitop_04.root ST_t-channel_antitop_04.root -1 1000 2018 MC ST_t-channel_antitop_04 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ST_t-channel_antitop_05.root ST_t-channel_antitop_05.root -1 1000 2018 MC ST_t-channel_antitop_05 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ST_t-channel_antitop_06.root ST_t-channel_antitop_06.root -1 1000 2018 MC ST_t-channel_antitop_06 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ST_t-channel_antitop_07.root ST_t-channel_antitop_07.root -1 1000 2018 MC ST_t-channel_antitop_07 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ST_t-channel_top_00.root ST_t-channel_top_00.root -1 1000 2018 MC ST_t-channel_top_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ST_t-channel_top_01.root ST_t-channel_top_01.root -1 1000 2018 MC ST_t-channel_top_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ST_t-channel_top_02.root ST_t-channel_top_02.root -1 1000 2018 MC ST_t-channel_top_02 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ST_t-channel_top_03.root ST_t-channel_top_03.root -1 1000 2018 MC ST_t-channel_top_03 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ST_t-channel_top_04.root ST_t-channel_top_04.root -1 1000 2018 MC ST_t-channel_top_04 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ST_t-channel_top_05.root ST_t-channel_top_05.root -1 1000 2018 MC ST_t-channel_top_05 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ST_t-channel_top_06.root ST_t-channel_top_06.root -1 1000 2018 MC ST_t-channel_top_06 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ST_t-channel_top_07.root ST_t-channel_top_07.root -1 1000 2018 MC ST_t-channel_top_07 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ST_t-channel_top_08.root ST_t-channel_top_08.root -1 1000 2018 MC ST_t-channel_top_08 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ST_t-channel_top_09.root ST_t-channel_top_09.root -1 1000 2018 MC ST_t-channel_top_09 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ST_t-channel_top_10.root ST_t-channel_top_10.root -1 1000 2018 MC ST_t-channel_top_10 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ST_t-channel_top_11.root ST_t-channel_top_11.root -1 1000 2018 MC ST_t-channel_top_11 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ST_tW_antitop_00.root ST_tW_antitop_00.root -1 1000 2018 MC ST_tW_antitop_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ST_tW_top_00.root ST_tW_top_00.root -1 1000 2018 MC ST_tW_top_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTTo2L2Nu_powheg_00.root TTTo2L2Nu_powheg_00.root -1 1000 2018 MC TTTo2L2Nu_powheg_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTTo2L2Nu_powheg_01.root TTTo2L2Nu_powheg_01.root -1 1000 2018 MC TTTo2L2Nu_powheg_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTTo2L2Nu_powheg_02.root TTTo2L2Nu_powheg_02.root -1 1000 2018 MC TTTo2L2Nu_powheg_02 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTTo2L2Nu_powheg_03.root TTTo2L2Nu_powheg_03.root -1 1000 2018 MC TTTo2L2Nu_powheg_03 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTTo2L2Nu_powheg_04.root TTTo2L2Nu_powheg_04.root -1 1000 2018 MC TTTo2L2Nu_powheg_04 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTTo2L2Nu_powheg_05.root TTTo2L2Nu_powheg_05.root -1 1000 2018 MC TTTo2L2Nu_powheg_05 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTTo2L2Nu_powheg_06.root TTTo2L2Nu_powheg_06.root -1 1000 2018 MC TTTo2L2Nu_powheg_06 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToHadronic_powheg_00.root TTToHadronic_powheg_00.root -1 1000 2018 MC TTToHadronic_powheg_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToHadronic_powheg_01.root TTToHadronic_powheg_01.root -1 1000 2018 MC TTToHadronic_powheg_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToHadronic_powheg_02.root TTToHadronic_powheg_02.root -1 1000 2018 MC TTToHadronic_powheg_02 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToHadronic_powheg_03.root TTToHadronic_powheg_03.root -1 1000 2018 MC TTToHadronic_powheg_03 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToHadronic_powheg_04.root TTToHadronic_powheg_04.root -1 1000 2018 MC TTToHadronic_powheg_04 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToHadronic_powheg_05.root TTToHadronic_powheg_05.root -1 1000 2018 MC TTToHadronic_powheg_05 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToHadronic_powheg_06.root TTToHadronic_powheg_06.root -1 1000 2018 MC TTToHadronic_powheg_06 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToHadronic_powheg_07.root TTToHadronic_powheg_07.root -1 1000 2018 MC TTToHadronic_powheg_07 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToHadronic_powheg_08.root TTToHadronic_powheg_08.root -1 1000 2018 MC TTToHadronic_powheg_08 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToHadronic_powheg_09.root TTToHadronic_powheg_09.root -1 1000 2018 MC TTToHadronic_powheg_09 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToHadronic_powheg_10.root TTToHadronic_powheg_10.root -1 1000 2018 MC TTToHadronic_powheg_10 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToHadronic_powheg_11.root TTToHadronic_powheg_11.root -1 1000 2018 MC TTToHadronic_powheg_11 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToHadronic_powheg_12.root TTToHadronic_powheg_12.root -1 1000 2018 MC TTToHadronic_powheg_12 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToHadronic_powheg_13.root TTToHadronic_powheg_13.root -1 1000 2018 MC TTToHadronic_powheg_13 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToHadronic_powheg_14.root TTToHadronic_powheg_14.root -1 1000 2018 MC TTToHadronic_powheg_14 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToSemiLeptonic_powheg_00.root TTToSemiLeptonic_powheg_00.root -1 1000 2018 MC TTToSemiLeptonic_powheg_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToSemiLeptonic_powheg_01.root TTToSemiLeptonic_powheg_01.root -1 1000 2018 MC TTToSemiLeptonic_powheg_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToSemiLeptonic_powheg_02.root TTToSemiLeptonic_powheg_02.root -1 1000 2018 MC TTToSemiLeptonic_powheg_02 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToSemiLeptonic_powheg_03.root TTToSemiLeptonic_powheg_03.root -1 1000 2018 MC TTToSemiLeptonic_powheg_03 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToSemiLeptonic_powheg_04.root TTToSemiLeptonic_powheg_04.root -1 1000 2018 MC TTToSemiLeptonic_powheg_04 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToSemiLeptonic_powheg_05.root TTToSemiLeptonic_powheg_05.root -1 1000 2018 MC TTToSemiLeptonic_powheg_05 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToSemiLeptonic_powheg_06.root TTToSemiLeptonic_powheg_06.root -1 1000 2018 MC TTToSemiLeptonic_powheg_06 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToSemiLeptonic_powheg_07.root TTToSemiLeptonic_powheg_07.root -1 1000 2018 MC TTToSemiLeptonic_powheg_07 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToSemiLeptonic_powheg_08.root TTToSemiLeptonic_powheg_08.root -1 1000 2018 MC TTToSemiLeptonic_powheg_08 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToSemiLeptonic_powheg_09.root TTToSemiLeptonic_powheg_09.root -1 1000 2018 MC TTToSemiLeptonic_powheg_09 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToSemiLeptonic_powheg_10.root TTToSemiLeptonic_powheg_10.root -1 1000 2018 MC TTToSemiLeptonic_powheg_10 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToSemiLeptonic_powheg_11.root TTToSemiLeptonic_powheg_11.root -1 1000 2018 MC TTToSemiLeptonic_powheg_11 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToSemiLeptonic_powheg_12.root TTToSemiLeptonic_powheg_12.root -1 1000 2018 MC TTToSemiLeptonic_powheg_12 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/TTToSemiLeptonic_powheg_13.root TTToSemiLeptonic_powheg_13.root -1 1000 2018 MC TTToSemiLeptonic_powheg_13 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/VBFHToTauTau_00.root VBFHToTauTau_00.root -1 1000 2018 MC VBFHToTauTau_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/VBFHToWWTo2L2Nu_00.root VBFHToWWTo2L2Nu_00.root -1 1000 2018 MC VBFHToWWTo2L2Nu_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/VVTo2L2Nu_00.root VVTo2L2Nu_00.root -1 1000 2018 MC VVTo2L2Nu_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/W1JetsToLNu_00.root W1JetsToLNu_00.root -1 1000 2018 MC W1JetsToLNu_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/W1JetsToLNu_01.root W1JetsToLNu_01.root -1 1000 2018 MC W1JetsToLNu_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/W1JetsToLNu_02.root W1JetsToLNu_02.root -1 1000 2018 MC W1JetsToLNu_02 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/W1JetsToLNu_03.root W1JetsToLNu_03.root -1 1000 2018 MC W1JetsToLNu_03 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/W1JetsToLNu_04.root W1JetsToLNu_04.root -1 1000 2018 MC W1JetsToLNu_04 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/W1JetsToLNu_05.root W1JetsToLNu_05.root -1 1000 2018 MC W1JetsToLNu_05 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/W2JetsToLNu_00.root W2JetsToLNu_00.root -1 1000 2018 MC W2JetsToLNu_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/W2JetsToLNu_01.root W2JetsToLNu_01.root -1 1000 2018 MC W2JetsToLNu_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/W2JetsToLNu_02.root W2JetsToLNu_02.root -1 1000 2018 MC W2JetsToLNu_02 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/W3JetsToLNu_00.root W3JetsToLNu_00.root -1 1000 2018 MC W3JetsToLNu_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/W3JetsToLNu_01.root W3JetsToLNu_01.root -1 1000 2018 MC W3JetsToLNu_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/W4JetsToLNu_00.root W4JetsToLNu_00.root -1 1000 2018 MC W4JetsToLNu_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/W4JetsToLNu_01.root W4JetsToLNu_01.root -1 1000 2018 MC W4JetsToLNu_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WJetsToLNu_Incl_00.root WJetsToLNu_Incl_00.root -1 1000 2018 MC WJetsToLNu_Incl_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WJetsToLNu_Incl_00.root WJetsToLNu_Incl_HT_00.root -1 1000 2018 MC WJetsToLNu_Incl_HT_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WJetsToLNu_Incl_01.root WJetsToLNu_Incl_01.root -1 1000 2018 MC WJetsToLNu_Incl_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WJetsToLNu_Incl_01.root WJetsToLNu_Incl_HT_01.root -1 1000 2018 MC WJetsToLNu_Incl_HT_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WJetsToLNu_Incl_02.root WJetsToLNu_Incl_02.root -1 1000 2018 MC WJetsToLNu_Incl_02 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WJetsToLNu_Incl_02.root WJetsToLNu_Incl_HT_02.root -1 1000 2018 MC WJetsToLNu_Incl_HT_02 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WJetsToLNu_Incl_03.root WJetsToLNu_Incl_03.root -1 1000 2018 MC WJetsToLNu_Incl_03 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WJetsToLNu_Incl_03.root WJetsToLNu_Incl_HT_03.root -1 1000 2018 MC WJetsToLNu_Incl_HT_03 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WJetsToLNu_Incl_04.root WJetsToLNu_Incl_04.root -1 1000 2018 MC WJetsToLNu_Incl_04 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WJetsToLNu_Incl_04.root WJetsToLNu_Incl_HT_04.root -1 1000 2018 MC WJetsToLNu_Incl_HT_04 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WJetsToLNu_Incl_05.root WJetsToLNu_Incl_05.root -1 1000 2018 MC WJetsToLNu_Incl_05 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WJetsToLNu_Incl_05.root WJetsToLNu_Incl_HT_05.root -1 1000 2018 MC WJetsToLNu_Incl_HT_05 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WJetsToLNu_Incl_06.root WJetsToLNu_Incl_06.root -1 1000 2018 MC WJetsToLNu_Incl_06 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WJetsToLNu_Incl_06.root WJetsToLNu_Incl_HT_06.root -1 1000 2018 MC WJetsToLNu_Incl_HT_06 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WJetsToLNu_Incl_07.root WJetsToLNu_Incl_07.root -1 1000 2018 MC WJetsToLNu_Incl_07 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WJetsToLNu_Incl_07.root WJetsToLNu_Incl_HT_07.root -1 1000 2018 MC WJetsToLNu_Incl_HT_07 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WJetsToLNu_Incl_08.root WJetsToLNu_Incl_08.root -1 1000 2018 MC WJetsToLNu_Incl_08 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WJetsToLNu_Incl_08.root WJetsToLNu_Incl_HT_08.root -1 1000 2018 MC WJetsToLNu_Incl_HT_08 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WWTo1L1Nu2Q_00.root WWTo1L1Nu2Q_00.root -1 1000 2018 MC WWTo1L1Nu2Q_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WWToLNuQQ_00.root WWToLNuQQ_00.root -1 1000 2018 MC WWToLNuQQ_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WWToLNuQQ_01.root WWToLNuQQ_01.root -1 1000 2018 MC WWToLNuQQ_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WWW_00.root WWW_00.root -1 1000 2018 MC WWW_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WWZ_00.root WWZ_00.root -1 1000 2018 MC WWZ_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WZTo3LNu_00.root WZTo3LNu_00.root -1 1000 2018 MC WZTo3LNu_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WZTo3LNu_01.root WZTo3LNu_01.root -1 1000 2018 MC WZTo3LNu_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WZZ_00.root WZZ_00.root -1 1000 2018 MC WZZ_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WminusHToTauTau_00.root WminusHToTauTau_00.root -1 1000 2018 MC WminusHToTauTau_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/WplusHToTauTau_00.root WplusHToTauTau_00.root -1 1000 2018 MC WplusHToTauTau_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ZHToTauTau_00.root ZHToTauTau_00.root -1 1000 2018 MC ZHToTauTau_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ZJetsToNuNu_HT100-200_00.root ZJetsToNuNu_HT100-200_00.root -1 1000 2018 MC ZJetsToNuNu_HT100-200_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ZJetsToNuNu_HT1200-2500_00.root ZJetsToNuNu_HT1200-2500_00.root -1 1000 2018 MC ZJetsToNuNu_HT1200-2500_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ZJetsToNuNu_HT200-400_00.root ZJetsToNuNu_HT200-400_00.root -1 1000 2018 MC ZJetsToNuNu_HT200-400_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ZJetsToNuNu_HT200-400_01.root ZJetsToNuNu_HT200-400_01.root -1 1000 2018 MC ZJetsToNuNu_HT200-400_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ZJetsToNuNu_HT200-400_02.root ZJetsToNuNu_HT200-400_02.root -1 1000 2018 MC ZJetsToNuNu_HT200-400_02 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ZJetsToNuNu_HT2500-Inf_00.root ZJetsToNuNu_HT2500-Inf_00.root -1 1000 2018 MC ZJetsToNuNu_HT2500-Inf_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ZJetsToNuNu_HT400-600_00.root ZJetsToNuNu_HT400-600_00.root -1 1000 2018 MC ZJetsToNuNu_HT400-600_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ZJetsToNuNu_HT800-1200_00.root ZJetsToNuNu_HT800-1200_00.root -1 1000 2018 MC ZJetsToNuNu_HT800-1200_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ZZTo2L2Q_00.root ZZTo2L2Q_00.root -1 1000 2018 MC ZZTo2L2Q_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ZZTo2L2Q_01.root ZZTo2L2Q_01.root -1 1000 2018 MC ZZTo2L2Q_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ZZTo2L2Q_02.root ZZTo2L2Q_02.root -1 1000 2018 MC ZZTo2L2Q_02 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ZZTo4L_00.root ZZTo4L_00.root -1 1000 2018 MC ZZTo4L_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/mutau/ZZZ_00.root ZZZ_00.root -1 1000 2018 MC ZZZ_00 $outDir


###########################  DATA #########################

./rootcom mutau_analyzer analyze_mutau  


./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonA_00.root SingleMuonA_00.root -1 1000 2018 DATA SingleMuonA_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonA_01.root SingleMuonA_01.root -1 1000 2018 DATA SingleMuonA_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonA_02.root SingleMuonA_02.root -1 1000 2018 DATA SingleMuonA_02 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonA_03.root SingleMuonA_03.root -1 1000 2018 DATA SingleMuonA_03 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonA_04.root SingleMuonA_04.root -1 1000 2018 DATA SingleMuonA_04 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonA_05.root SingleMuonA_05.root -1 1000 2018 DATA SingleMuonA_05 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonA_06.root SingleMuonA_06.root -1 1000 2018 DATA SingleMuonA_06 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonB_00.root SingleMuonB_00.root -1 1000 2018 DATA SingleMuonB_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonB_01.root SingleMuonB_01.root -1 1000 2018 DATA SingleMuonB_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonB_02.root SingleMuonB_02.root -1 1000 2018 DATA SingleMuonB_02 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonB_03.root SingleMuonB_03.root -1 1000 2018 DATA SingleMuonB_03 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonB_04.root SingleMuonB_04.root -1 1000 2018 DATA SingleMuonB_04 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonC_00.root SingleMuonC_00.root -1 1000 2018 DATA SingleMuonC_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonC_01.root SingleMuonC_01.root -1 1000 2018 DATA SingleMuonC_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonC_02.root SingleMuonC_02.root -1 1000 2018 DATA SingleMuonC_02 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonC_03.root SingleMuonC_03.root -1 1000 2018 DATA SingleMuonC_03 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonD_PromptReco_00.root SingleMuonD_PromptReco_00.root -1 1000 2018 DATA SingleMuonD_PromptReco_00 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonD_PromptReco_01.root SingleMuonD_PromptReco_01.root -1 1000 2018 DATA SingleMuonD_PromptReco_01 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonD_PromptReco_02.root SingleMuonD_PromptReco_02.root -1 1000 2018 DATA SingleMuonD_PromptReco_02 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonD_PromptReco_03.root SingleMuonD_PromptReco_03.root -1 1000 2018 DATA SingleMuonD_PromptReco_03 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonD_PromptReco_04.root SingleMuonD_PromptReco_04.root -1 1000 2018 DATA SingleMuonD_PromptReco_04 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonD_PromptReco_05.root SingleMuonD_PromptReco_05.root -1 1000 2018 DATA SingleMuonD_PromptReco_05 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonD_PromptReco_06.root SingleMuonD_PromptReco_06.root -1 1000 2018 DATA SingleMuonD_PromptReco_06 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonD_PromptReco_07.root SingleMuonD_PromptReco_07.root -1 1000 2018 DATA SingleMuonD_PromptReco_07 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonD_PromptReco_08.root SingleMuonD_PromptReco_08.root -1 1000 2018 DATA SingleMuonD_PromptReco_08 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonD_PromptReco_09.root SingleMuonD_PromptReco_09.root -1 1000 2018 DATA SingleMuonD_PromptReco_09 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonD_PromptReco_10.root SingleMuonD_PromptReco_10.root -1 1000 2018 DATA SingleMuonD_PromptReco_10 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/blinded_data/2018/mutau/SingleMuonD_PromptReco_11.root SingleMuonD_PromptReco_11.root -1 1000 2018 DATA SingleMuonD_PromptReco_11 $outDir



###########################   Signal  #########################

./rootcom mutau_analyzer analyze_mutau  


./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_200_MH4_100.root MH3_200_MH4_100.root -1 1000 2018 MC MH3_200_MH4_100 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_200_MH4_150.root MH3_200_MH4_150.root -1 1000 2018 MC MH3_200_MH4_150 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_300_MH4_100.root MH3_300_MH4_100.root -1 1000 2018 MC MH3_300_MH4_100 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_300_MH4_150.root MH3_300_MH4_150.root -1 1000 2018 MC MH3_300_MH4_150 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_400_MH4_100.root MH3_400_MH4_100.root -1 1000 2018 MC MH3_400_MH4_100 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_400_MH4_150.root MH3_400_MH4_150.root -1 1000 2018 MC MH3_400_MH4_150 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_400_MH4_200.root MH3_400_MH4_200.root -1 1000 2018 MC MH3_400_MH4_200 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_400_MH4_250.root MH3_400_MH4_250.root -1 1000 2018 MC MH3_400_MH4_250 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_500_MH4_150.root MH3_500_MH4_150.root -1 1000 2018 MC MH3_500_MH4_150 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_500_MH4_200.root MH3_500_MH4_200.root -1 1000 2018 MC MH3_500_MH4_200 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_500_MH4_250.root MH3_500_MH4_250.root -1 1000 2018 MC MH3_500_MH4_250 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_500_MH4_300.root MH3_500_MH4_300.root -1 1000 2018 MC MH3_500_MH4_300 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_600_MH4_100.root MH3_600_MH4_100.root -1 1000 2018 MC MH3_600_MH4_100 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_600_MH4_150.root MH3_600_MH4_150.root -1 1000 2018 MC MH3_600_MH4_150 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_600_MH4_200.root MH3_600_MH4_200.root -1 1000 2018 MC MH3_600_MH4_200 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_600_MH4_250.root MH3_600_MH4_250.root -1 1000 2018 MC MH3_600_MH4_250 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_600_MH4_300.root MH3_600_MH4_300.root -1 1000 2018 MC MH3_600_MH4_300 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_600_MH4_350.root MH3_600_MH4_350.root -1 1000 2018 MC MH3_600_MH4_350 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_600_MH4_400.root MH3_600_MH4_400.root -1 1000 2018 MC MH3_600_MH4_400 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_600_MH4_500.root MH3_600_MH4_500.root -1 1000 2018 MC MH3_600_MH4_500 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_700_MH4_250.root MH3_700_MH4_250.root -1 1000 2018 MC MH3_700_MH4_250 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_700_MH4_300.root MH3_700_MH4_300.root -1 1000 2018 MC MH3_700_MH4_300 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_700_MH4_350.root MH3_700_MH4_350.root -1 1000 2018 MC MH3_700_MH4_350 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_700_MH4_400.root MH3_700_MH4_400.root -1 1000 2018 MC MH3_700_MH4_400 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_800_MH4_250.root MH3_800_MH4_250.root -1 1000 2018 MC MH3_800_MH4_250 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_800_MH4_300.root MH3_800_MH4_300.root -1 1000 2018 MC MH3_800_MH4_300 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_800_MH4_350.root MH3_800_MH4_350.root -1 1000 2018 MC MH3_800_MH4_350 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_800_MH4_500.root MH3_800_MH4_500.root -1 1000 2018 MC MH3_800_MH4_500 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_900_MH4_300.root MH3_900_MH4_300.root -1 1000 2018 MC MH3_900_MH4_300 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_900_MH4_350.root MH3_900_MH4_350.root -1 1000 2018 MC MH3_900_MH4_350 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_900_MH4_400.root MH3_900_MH4_400.root -1 1000 2018 MC MH3_900_MH4_400 $outDir
./MakeCondorFiles.csh analyze_mutau /hdfs/store/user/jmadhusu/2018_skimmed/signal_gg/MH3_900_MH4_500.root MH3_900_MH4_500.root -1 1000 2018 MC MH3_900_MH4_500 $outDir

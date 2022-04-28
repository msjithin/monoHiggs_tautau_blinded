#!/bin/bash
set -e  # exit when any command fails

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

./rootcom skimm_signal_2018 analyze_signal

outFile="outSkimmed_et.root"
nEvents=10000
sample='dy'
plottingOn=0
while getopts n:s:p option
do
    case "${option}"
	in
	n) nEvents=${OPTARG};;
	p) plottingOn=1 ;;
	s) sample=${OPTARG};;
esac
done

outFile="outSkimmed_et_signal.root"
echo "dy sample analysis....."
./analyze_signal /hdfs/store/user/jmadhusu/Signal_Zpbaryonic2018_Apr2022/MonoHToTauTau_ZpBaryonic_TuneCP2_13TeV_madgraph-pythia8/crab_job_MonoHToTauTau_ZpBaryonic_2018/220427_134433/0000/ $outFile $nEvents 1000 2018 MC
#./analyze_etau_updated /hdfs/store/user/jmadhusu/MC2018_Autumn18_monoHiggs_24Apr2020/DY1JetsToLL_M-50_TuneCP5_13TeV-madgraphMLM-pythia8/crab_job_DY1JetsToLL/200424_080942/0000/ $outFile $nEvents 1000 2018_test MC


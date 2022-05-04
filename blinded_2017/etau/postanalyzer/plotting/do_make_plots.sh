set -e

inFile=f_mutau_initial.root
#inFile=$1
#declare -a plotList=("elePt" "eleEta" "elePhi" "tauPt" "tauEta" "tauPhi" "tauIso" "tauDecayMode" "tauCharge" "tauAntiEle" "tauAntiMu" "deltaR" "higgsPt" "nJet" "visMass" "met" "metPhi" "deltaPhi" "deltaEta" "metLongXaxis" "tot_TMass" "tot_TMass_full") 
declare -a plotList=("muPt" "muEta" "muPhi" "tauPt" "tauEta" "tauPhi" "tauDecayMode" "tauCharge" "deltaR" "higgsPt" "nJet" "visMass" "met" "metPhi" "deltaPhi" "deltaEta" "metLongXaxis" "tot_TMass" "tot_TMass_full") 

declare -a indexList=("_5" "_6" "_7" "_8" "_9")

FILE=eventYield.csv
if [ -f "$FILE" ]; then
    echo "$FILE exists."
    rm eventYield.csv
fi
for i in "${indexList[@]}"
do
    for j in "${plotList[@]}"
    do 
	hist=$j$i
	python makeplot.py -in $inFile -name $hist -cat 0 -ch mutau -xaxis $hist -year 2017 --blindingRatio 5 
    done
    wait
done

wait
# python makeplot.py -in $inFile -name cutflow_n -cat 0 -ch mutau -xaxis "cutflow" -lY  -year 2017 --blindingRatio 5

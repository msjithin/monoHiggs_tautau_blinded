set -e


# declare -a plotList=("elePt" "eleEta" "elePhi" "tauPt" "tauEta" "tauPhi" "tauIso" "tauDecayMode" "tauCharge" "deltaR" "higgsPt" "nJet" "visMass" "mT_eleMet" "trigger" "genMatch" "met" "metPhi" "deltaPhi" "deltaEta" "metLongXaxis" "tot_TMass" "tot_TMass_full") 
declare -a plotList=("elePt" "eleEta" "tauPt" "tauEta" "deltaR" "higgsPt" "nJet" "visMass" "met" "metPhi" "metLongXaxis" "tot_TMass" "tot_TMass_full" "delptaPhi_HptMet") 
#declare -a plotList=("elePt" "eleEta" "tauPt" "tauEta" "tauPhi" "delptaPhi_HptMet")
for j in "${plotList[@]}"
do 
    python get_zll.py --hist $j
    python get_small_mc.py --hist $j
    python get_jetFakes.py --hist $j
    python get_jetFakes_unc.py --hist $j


done

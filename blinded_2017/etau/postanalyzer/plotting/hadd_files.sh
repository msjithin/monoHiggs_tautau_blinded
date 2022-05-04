


limit(){
    hadd -f f_etau_initial.root files_nominal/*tot_TMass_full*.root
    hadd -f f_etau_up.root files_up/*tot_TMass_full*.root
    hadd -f f_etau_down.root files_down/*tot_TMass_full*.root
}

hadd_each(){   
    declare -a plotList=("elePt" "eleEta" "elePhi" "tauPt" "tauEta" "tauPhi" "tauIso" "tauDecayMode" "tauCharge" "deltaR" "higgsPt" "nJet" "visMass" "mT_eleMet" "trigger" "genMatch" "met" "metPhi" "deltaPhi" "deltaEta" "metLongXaxis" "tot_TMass" "tot_TMass_full" "delptaPhi_HptMet") 
    #declare -a plotList=("elePt" "eleEta" "tauPt" "tauEta" "tauPhi" "delptaPhi_HptMet")
    for i in "${plotList[@]}"
    do
	hadd f_${i}_initial.root sample/*${i}.root
	hadd f_${i}_up.root sample/*${i}_up.root
	hadd f_${i}_down.root sample/*${i}_down.root
    done
}
hadd_etau(){
    hadd -f f_etau_initial.root sample/*tot_TMass_full.root
    hadd -f f_etau_up.root sample/*tot_TMass_full_up.root
    hadd -f f_etau_down.root sample/*tot_TMass_full_down.root
}
hadd_selected(){   
    declare -a plotList=("elePt" "eleEta" "tauPt" "tauEta" "deltaR" "higgsPt" "nJet" "visMass" "met" "metPhi" "metLongXaxis" "tot_TMass" "tot_TMass_full" "delptaPhi_HptMet") 
    #declare -a plotList=("elePt" "eleEta" "tauPt" "tauEta" "tauPhi" "delptaPhi_HptMet")
    for i in "${plotList[@]}"
    do
	hadd f_${i}_initial.root sample/*${i}.root
	hadd f_${i}_up.root sample/*${i}_up.root
	hadd f_${i}_down.root sample/*${i}_down.root
    done
}


elept(){

    hadd -f f_elePt_initial.root sample/*elePt.root
    hadd -f f_elePt_up.root sample/*elePt_up.root
    hadd -f f_elePt_down.root sample/*elePt_down.root
}

all(){
    hadd_selected
    hadd_etau
}

"$@"

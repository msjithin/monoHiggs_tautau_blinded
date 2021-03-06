#include <TH2.h>
#include "ComputeFF2018/FFcode/interface/ApplyFF.h"
#include <TStyle.h>
#include <TCanvas.h>
#include <TGraph.h>
#include <TGraphAsymmErrors.h>
#include "TMultiGraph.h"
#include <iostream>
#include <vector>
#include <string>
#include <sstream>
#include <utility>
#include <stdio.h>
#include <TF1.h>
#include <TDirectoryFile.h>
#include <TRandom3.h>
#include "TLorentzVector.h"
#include "TString.h"
#include "ComputeFF2018/FFcode/interface/ScaleFactor.h"
#include "TLegend.h"
#include "TH1F.h"
#include "TKey.h"
#include "THashList.h"
#include "THStack.h"
#include "TPaveLabel.h"
#include "TFile.h"
#include "ComputeFF2018/FFcode/interface/myHelper.h"
#include "ComputeFF2018/FFcode/interface/tt_Tree.h"
#include "ComputeFF2018/FFcode/interface/LumiReweightingStandAlone.h"
#include "TauAnalysisTools/TauTriggerSFs/interface/TauTriggerSFs2017.h"
#include "TauAnalysisTools/TauTriggerSFs/interface/SFProvider.h"
#include "RooWorkspace.h"
#include "RooRealVar.h"
#include "RooFunctor.h"
#include "ComputeFF2018/FFcode/interface/SFtautrigger.h"

using namespace std;

int main(int argc, char** argv) {

    int do_control_plots=0;

    std::string input = *(argv + 1);
    std::string output = *(argv + 2);
    std::string sample = *(argv + 3);
    std::string name = *(argv + 4);
    std::string year = *(argv + 5);

    TFile *f_Double = new TFile(input.c_str());
    cout<<"XXXXXXXXXXXXX "<<input.c_str()<<" XXXXXXXXXXXX"<<endl;
    TTree *arbre = (TTree*) f_Double->Get("tautau_tree");
    TH1F* nbevt = (TH1F*) f_Double->Get("nevents");
    float ngen = nbevt->GetBinContent(2);

    float xs=1.0; float weight=1.0; float luminosity=59740.0;
    if (year=="2017") luminosity=41529.0;
    if (year=="2016") luminosity=35922.0;
    if (sample=="DY" or sample=="ZL" or sample=="ZTT" or sample=="ZJ" or sample=="ZLL"){ xs=6225.42; weight=luminosity*xs/ngen;}
    if (sample=="DYlow"){ xs=21658.0; weight=luminosity*xs/ngen;}
    else if (sample=="TT" or sample=="TTT" or sample=="TTJ") {xs=831.76; weight=luminosity*xs/ngen;}
    else if (sample=="TTTo2L2Nu") {xs=88.29; weight=luminosity*xs/ngen;}
    else if (sample=="TTToSemiLeptonic") {xs=365.35; weight=luminosity*xs/ngen;}
    else if (sample=="TTToHadronic") {xs=377.96; weight=luminosity*xs/ngen;}
    else if (sample=="W") {xs=61526.7; weight=luminosity*xs/ngen;}
    else if (sample=="data_obs"){weight=1.0;}
    else if (sample=="embedded"){weight=1.0;}
    else if (sample=="WZ1L1Nu2Q") {xs=11.66; weight=luminosity*xs/ngen;}
    else if (sample=="WZ1L3Nu") {xs=3.293; weight=luminosity*xs/ngen;}
    else if (sample=="WZJets") {xs=5.26; weight=luminosity*xs/ngen;}
    else if (sample=="WZ3LNu") {xs=5.052; weight=luminosity*xs/ngen;}
    else if (sample=="WZ2L2Q") {xs=6.331; weight=luminosity*xs/ngen;}
    else if (sample=="WW1L1Nu2Q") {xs=49.997; weight=luminosity*xs/ngen;}
    else if (sample=="ZZ4L") {xs=1.325; weight=luminosity*xs/ngen;}
    else if (sample=="VV2L2Nu") {xs=13.97; weight=luminosity*xs/ngen;}
    else if (sample=="WW2L2Nu") {xs=11.08; weight=luminosity*xs/ngen;}
    else if (sample=="ZZ2L2Nu") {xs=0.6008; weight=luminosity*xs/ngen;}
    else if (sample=="ZZ2L2Q") {xs=3.688; weight=luminosity*xs/ngen;}
    else if (sample=="WW4Q") {xs=47.73; weight=luminosity*xs/ngen;}
    else if (sample=="WWLNuQQ") {xs=45.99; weight=luminosity*xs/ngen;}
    else if (sample=="ST_tW_antitop") {xs=35.85; weight=luminosity*xs/ngen;}
    else if (sample=="ST_tW_top") {xs=35.85; weight=luminosity*xs/ngen;}
    else if (sample=="ST_t_antitop") {xs=26.23; weight=luminosity*xs/ngen;}
    else if (sample=="ST_t_top") {xs=44.07; weight=luminosity*xs/ngen;}
    else if (sample=="ggH_htt125") {xs=48.58*0.0627; weight=luminosity*xs/ngen;}
    else if (sample=="qqH_htt125") {xs=3.782*0.0627; weight=luminosity*xs/ngen;}
    else if (sample=="WplusH125") {xs=0.840*0.0627; weight=luminosity*xs/ngen;}
    else if (sample=="WminusH125") {xs=0.5328*0.0627; weight=luminosity*xs/ngen;}
    else if (sample=="ZH125") {xs=0.8839*0.0627; weight=luminosity*xs/ngen;}
    else if (sample=="ZZ") {xs=16.523; weight=luminosity*xs/ngen;}
    else if (sample=="WZ") {xs=47.13; weight=luminosity*xs/ngen;}
    else if (sample=="WW") {xs=118.7; weight=luminosity*xs/ngen;}
    else if (sample=="WGLNu") {xs=489.0; weight=luminosity*xs/ngen;}
    else if (sample=="WGstarMuMu") {xs=2.793; weight=luminosity*xs/ngen;}
    else if (sample=="WGstarEE") {xs=3.526; weight=luminosity*xs/ngen;}
    else if (sample=="EWKWminus") {xs=23.24; weight=luminosity*xs/ngen;}
    else if (sample=="EWKWplus") {xs=29.59; weight=luminosity*xs/ngen;}
    else if (sample=="EWKZLL" or sample=="EWKZLL_TT" or sample=="EWKZLL_J" or sample=="EWKZLL_L" or sample=="EWKZLL_LL") {xs=4.321; weight=luminosity*xs/ngen;}
    else if (sample=="EWKZNuNu" or sample=="EWKZNuNu_TT" or sample=="EWKZNuNu_J" or sample=="EWKZNuNu_L" or sample=="EWKZNuNu_LL") {xs=10.66; weight=luminosity*xs/ngen;}

    cout.setf(ios::fixed, ios::floatfield);
    cout.precision(10);

    arbre->SetBranchAddress("Rivet_higgsPt", &Rivet_higgsPt);
    arbre->SetBranchAddress("Rivet_nJets30", &Rivet_nJets30);
    arbre->SetBranchAddress("Rivet_stage0_cat", &Rivet_stage0_cat);
    arbre->SetBranchAddress("Rivet_stage1p1_cat", &Rivet_stage1p1_cat);
    arbre->SetBranchAddress("Rivet_stage1_cat_pTjet30GeV", &Rivet_stage1_cat_pTjet30GeV);

    arbre->SetBranchAddress("run", &run);
    arbre->SetBranchAddress("lumi", &lumi);
    arbre->SetBranchAddress("evt", &evt);
    arbre->SetBranchAddress("npv", &npv);
    arbre->SetBranchAddress("pt_1", &pt_1);
    arbre->SetBranchAddress("phi_1", &phi_1);
    arbre->SetBranchAddress("eta_1", &eta_1);
    arbre->SetBranchAddress("m_1", &m_1);
    arbre->SetBranchAddress("q_1", &q_1);
    arbre->SetBranchAddress("nbtag", &nbtag);
    arbre->SetBranchAddress("q_2", &q_2);
    arbre->SetBranchAddress("pt_2", &pt_2);
    arbre->SetBranchAddress("eta_2", &eta_2);
    arbre->SetBranchAddress("m_2", &m_2);
    arbre->SetBranchAddress("phi_2", &phi_2);
    arbre->SetBranchAddress("met", &met);
    arbre->SetBranchAddress("met", &met);
    arbre->SetBranchAddress("metphi", &metphi);
    arbre->SetBranchAddress("met_UESUp", &met_UESUp);
    arbre->SetBranchAddress("metphi_UESDown", &metphi_UESDown);
    arbre->SetBranchAddress("met_UESDown", &met_UESDown);
    arbre->SetBranchAddress("metphi_UESUp", &metphi_UESUp);
    arbre->SetBranchAddress("met_responseUp", &met_responseUp);
    arbre->SetBranchAddress("metphi_responseUp", &metphi_responseUp);
    arbre->SetBranchAddress("met_responseDown", &met_responseDown);
    arbre->SetBranchAddress("metphi_responseDown", &metphi_responseDown);
    arbre->SetBranchAddress("met_resolutionUp", &met_resolutionUp);
    arbre->SetBranchAddress("metphi_resolutionUp", &metphi_resolutionUp);
    arbre->SetBranchAddress("met_resolutionDown", &met_resolutionDown);
    arbre->SetBranchAddress("metphi_resolutionDown", &metphi_resolutionDown);
    arbre->SetBranchAddress("metphi_JetEta0to3Down", &metphi_JetEta0to3Down);
    arbre->SetBranchAddress("met_JetEta0to3Down", &met_JetEta0to3Down);
    arbre->SetBranchAddress("metphi_JetEta0to3Up", &metphi_JetEta0to3Up);
    arbre->SetBranchAddress("met_JetEta0to3Up", &met_JetEta0to3Up);
    arbre->SetBranchAddress("metphi_JetEta0to5Down", &metphi_JetEta0to5Down);
    arbre->SetBranchAddress("met_JetEta0to5Down", &met_JetEta0to5Down);
    arbre->SetBranchAddress("metphi_JetEta0to5Up", &metphi_JetEta0to5Up);
    arbre->SetBranchAddress("met_JetEta0to5Up", &met_JetEta0to5Up);
    arbre->SetBranchAddress("metphi_JetEta3to5Down", &metphi_JetEta3to5Down);
    arbre->SetBranchAddress("met_JetEta3to5Down", &met_JetEta3to5Down);
    arbre->SetBranchAddress("metphi_JetEta3to5Up", &metphi_JetEta3to5Up);
    arbre->SetBranchAddress("met_JetEta3to5Up", &met_JetEta3to5Up);
    arbre->SetBranchAddress("metphi_JetRelativeSampleDown", &metphi_JetRelativeSampleDown);
    arbre->SetBranchAddress("met_JetRelativeSampleDown", &met_JetRelativeSampleDown);
    arbre->SetBranchAddress("metphi_JetRelativeSampleUp", &metphi_JetRelativeSampleUp);
    arbre->SetBranchAddress("met_JetRelativeSampleUp", &met_JetRelativeSampleUp);
    arbre->SetBranchAddress("metphi_JetRelativeBalDown", &metphi_JetRelativeBalDown);
    arbre->SetBranchAddress("met_JetRelativeBalDown", &met_JetRelativeBalDown);
    arbre->SetBranchAddress("metphi_JetRelativeBalUp", &metphi_JetRelativeBalUp);
    arbre->SetBranchAddress("met_JetRelativeBalUp", &met_JetRelativeBalUp);
    arbre->SetBranchAddress("metphi_JetEC2Down", &metphi_JetEC2Down);
    arbre->SetBranchAddress("met_JetEC2Down", &met_JetEC2Down);
    arbre->SetBranchAddress("metphi_JetEC2Up", &metphi_JetEC2Up);
    arbre->SetBranchAddress("met_JetEC2Up", &met_JetEC2Up);
    arbre->SetBranchAddress("njets_JetEC2Down", &njets_JetEC2Down);
    arbre->SetBranchAddress("njets_JetEC2Up", &njets_JetEC2Up);
    arbre->SetBranchAddress("mjj_JetEC2Down", &mjj_JetEC2Down);
    arbre->SetBranchAddress("mjj_JetEC2Up", &mjj_JetEC2Up);
    arbre->SetBranchAddress("njets", &njets);
    arbre->SetBranchAddress("njets_JetEta0to3Down", &njets_JetEta0to3Down);
    arbre->SetBranchAddress("njets_JetEta0to3Up", &njets_JetEta0to3Up);
    arbre->SetBranchAddress("njets_JetRelativeSampleDown", &njets_JetRelativeSampleDown);
    arbre->SetBranchAddress("njets_JetRelativeSampleUp", &njets_JetRelativeSampleUp);
    arbre->SetBranchAddress("njets_JetRelativeBalDown", &njets_JetRelativeBalDown);
    arbre->SetBranchAddress("njets_JetRelativeBalUp", &njets_JetRelativeBalUp);
    arbre->SetBranchAddress("njets_JetEta0to5Down", &njets_JetEta0to5Down);
    arbre->SetBranchAddress("njets_JetEta0to5Up", &njets_JetEta0to5Up);
    arbre->SetBranchAddress("njets_JetEta3to5Down", &njets_JetEta3to5Down);
    arbre->SetBranchAddress("njets_JetEta3to5Up", &njets_JetEta3to5Up);
    arbre->SetBranchAddress("jpt_1", &jpt_1);
    arbre->SetBranchAddress("jeta_1", &jeta_1);
    arbre->SetBranchAddress("jphi_1", &jphi_1);
    arbre->SetBranchAddress("jpt_2", &jpt_2);
    arbre->SetBranchAddress("jeta_2", &jeta_2);
    arbre->SetBranchAddress("jphi_2", &jphi_2);
    arbre->SetBranchAddress("bpt_1", &bpt_1);
    arbre->SetBranchAddress("beta_1", &beta_1);
    arbre->SetBranchAddress("bphi_1", &bphi_1);
    arbre->SetBranchAddress("bpt_2", &bpt_2);
    arbre->SetBranchAddress("beta_2", &beta_2);
    arbre->SetBranchAddress("bphi_2", &bphi_2);
    arbre->SetBranchAddress("bflavor_1", &bflavor_1);
    arbre->SetBranchAddress("bflavor_2", &bflavor_2);
    arbre->SetBranchAddress("mjj", &mjj);
    arbre->SetBranchAddress("mjj_JetEta0to3Down", &mjj_JetEta0to3Down);
    arbre->SetBranchAddress("mjj_JetEta0to3Up", &mjj_JetEta0to3Up);
    arbre->SetBranchAddress("mjj_JetEta3to5Down", &mjj_JetEta3to5Down);
    arbre->SetBranchAddress("mjj_JetEta3to5Up", &mjj_JetEta3to5Up);
    arbre->SetBranchAddress("mjj_JetEta0to5Down", &mjj_JetEta0to5Down);
    arbre->SetBranchAddress("mjj_JetEta0to5Up", &mjj_JetEta0to5Up);
    arbre->SetBranchAddress("mjj_JetRelativeBalDown", &mjj_JetRelativeBalDown);
    arbre->SetBranchAddress("mjj_JetRelativeBalUp", &mjj_JetRelativeBalUp);
    arbre->SetBranchAddress("mjj_JetRelativeSampleDown", &mjj_JetRelativeSampleDown);
    arbre->SetBranchAddress("mjj_JetRelativeSampleUp", &mjj_JetRelativeSampleUp);
    arbre->SetBranchAddress("genweight", &genweight);

    arbre->SetBranchAddress("byVVVLooseDeepVSjet_2",&byVVVLooseDeepVSjet_2);
    arbre->SetBranchAddress("byVVLooseDeepVSjet_2",&byVVLooseDeepVSjet_2);
    arbre->SetBranchAddress("byVLooseDeepVSjet_2",&byVLooseDeepVSjet_2);
    arbre->SetBranchAddress("byLooseDeepVSjet_2",&byLooseDeepVSjet_2);
    arbre->SetBranchAddress("byMediumDeepVSjet_2",&byMediumDeepVSjet_2);
    arbre->SetBranchAddress("byTightDeepVSjet_2",&byTightDeepVSjet_2);
    arbre->SetBranchAddress("byVTightDeepVSjet_2",&byVTightDeepVSjet_2);
    arbre->SetBranchAddress("byVVVLooseDeepVSmu_2",&byVVVLooseDeepVSmu_2);
    arbre->SetBranchAddress("byVVLooseDeepVSmu_2",&byVVLooseDeepVSmu_2);
    arbre->SetBranchAddress("byVLooseDeepVSmu_2",&byVLooseDeepVSmu_2);
    arbre->SetBranchAddress("byLooseDeepVSmu_2",&byLooseDeepVSmu_2);
    arbre->SetBranchAddress("byMediumDeepVSmu_2",&byMediumDeepVSmu_2);
    arbre->SetBranchAddress("byTightDeepVSmu_2",&byTightDeepVSmu_2);
    arbre->SetBranchAddress("byVTightDeepVSmu_2",&byVTightDeepVSmu_2);
    arbre->SetBranchAddress("byVVVLooseDeepVSe_2",&byVVVLooseDeepVSe_2);
    arbre->SetBranchAddress("byVVLooseDeepVSe_2",&byVVLooseDeepVSe_2);
    arbre->SetBranchAddress("byVLooseDeepVSe_2",&byVLooseDeepVSe_2);
    arbre->SetBranchAddress("byLooseDeepVSe_2",&byLooseDeepVSe_2);
    arbre->SetBranchAddress("byMediumDeepVSe_2",&byMediumDeepVSe_2);
    arbre->SetBranchAddress("byTightDeepVSe_2",&byTightDeepVSe_2);
    arbre->SetBranchAddress("byVTightDeepVSe_2",&byVTightDeepVSe_2);

    arbre->SetBranchAddress("byVVVLooseDeepVSjet_1",&byVVVLooseDeepVSjet_1);
    arbre->SetBranchAddress("byVVLooseDeepVSjet_1",&byVVLooseDeepVSjet_1);
    arbre->SetBranchAddress("byVLooseDeepVSjet_1",&byVLooseDeepVSjet_1);
    arbre->SetBranchAddress("byLooseDeepVSjet_1",&byLooseDeepVSjet_1);
    arbre->SetBranchAddress("byMediumDeepVSjet_1",&byMediumDeepVSjet_1);
    arbre->SetBranchAddress("byTightDeepVSjet_1",&byTightDeepVSjet_1);
    arbre->SetBranchAddress("byVTightDeepVSjet_1",&byVTightDeepVSjet_1);
    arbre->SetBranchAddress("byVVVLooseDeepVSmu_1",&byVVVLooseDeepVSmu_1);
    arbre->SetBranchAddress("byVVLooseDeepVSmu_1",&byVVLooseDeepVSmu_1);
    arbre->SetBranchAddress("byVLooseDeepVSmu_1",&byVLooseDeepVSmu_1);
    arbre->SetBranchAddress("byLooseDeepVSmu_1",&byLooseDeepVSmu_1);
    arbre->SetBranchAddress("byMediumDeepVSmu_1",&byMediumDeepVSmu_1);
    arbre->SetBranchAddress("byTightDeepVSmu_1",&byTightDeepVSmu_1);
    arbre->SetBranchAddress("byVTightDeepVSmu_1",&byVTightDeepVSmu_1);
    arbre->SetBranchAddress("byVVVLooseDeepVSe_1",&byVVVLooseDeepVSe_1);
    arbre->SetBranchAddress("byVVLooseDeepVSe_1",&byVVLooseDeepVSe_1);
    arbre->SetBranchAddress("byVLooseDeepVSe_1",&byVLooseDeepVSe_1);
    arbre->SetBranchAddress("byLooseDeepVSe_1",&byLooseDeepVSe_1);
    arbre->SetBranchAddress("byMediumDeepVSe_1",&byMediumDeepVSe_1);
    arbre->SetBranchAddress("byTightDeepVSe_1",&byTightDeepVSe_1);
    arbre->SetBranchAddress("byVTightDeepVSe_1",&byVTightDeepVSe_1);

    arbre->SetBranchAddress("passDoubleTightTau35TightID", &passDoubleTightTau35TightID);
    arbre->SetBranchAddress("passDoubleMediumTau40TightID", &passDoubleMediumTau40TightID);
    arbre->SetBranchAddress("passDoubleTightTau40ID", &passDoubleTightTau40ID);
    arbre->SetBranchAddress("passDoubleMediumHPSTau35", &passDoubleMediumHPSTau35);
    arbre->SetBranchAddress("passDoubleTau35", &passDoubleTau35);
    arbre->SetBranchAddress("passDoubleTauCmb35", &passDoubleTauCmb35);

    arbre->SetBranchAddress("l2_decayMode",&l2_decayMode);
    arbre->SetBranchAddress("l1_decayMode",&l1_decayMode);
    arbre->SetBranchAddress("gen_match_1",&gen_match_1);
    arbre->SetBranchAddress("gen_match_2",&gen_match_2);
    arbre->SetBranchAddress("npu",&npu);
    arbre->SetBranchAddress("genpT",&genpT);
    arbre->SetBranchAddress("genM",&genM);
    arbre->SetBranchAddress("pt_top1",&pt_top1);
    arbre->SetBranchAddress("pt_top2",&pt_top2);
    arbre->SetBranchAddress("numGenJets",&numGenJets);

   int nbhist=1;

   float bins_mtt0[] = {0,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,250,300,350};
   int  binnum_mtt0 = sizeof(bins_mtt0)/sizeof(Float_t) - 1;

   TH1F* h0LT_qcd_iso = new TH1F ("h0LT_qcd_iso","h0LT_qcd_iso",binnum_mtt0,bins_mtt0); h0LT_qcd_iso->Sumw2();
   TH1F* h0LT_qcd_anti = new TH1F ("h0LT_qcd_anti","h0LT_qcd_anti",binnum_mtt0,bins_mtt0); h0LT_qcd_anti->Sumw2();
   TH1F* h0J_qcd_iso = new TH1F ("h0J_qcd_iso","h0J_qcd_iso",binnum_mtt0,bins_mtt0); h0J_qcd_iso->Sumw2();
   TH1F* h0J_qcd_anti = new TH1F ("h0J_qcd_anti","h0J_qcd_anti",binnum_mtt0,bins_mtt0); h0J_qcd_anti->Sumw2();

   string datapath = string(std::getenv("CMSSW_BASE"))+"/src/ComputeFF2018/FFcode/data/";

   reweight::LumiReWeighting* LumiWeights_12;
   LumiWeights_12 = new reweight::LumiReWeighting((datapath+"pu_distributions_mc_2018.root").c_str(), (datapath+"pu_distributions_data_2018.root").c_str(), "pileup", "pileup");
   if (year=="2016"){
     LumiWeights_12 = new reweight::LumiReWeighting((datapath+"MC_Moriond17_PU25ns_V1.root").c_str(), (datapath+"Data_Pileup_2016_271036-284044_80bins.root").c_str(), "pileup", "pileup");
   }
   else if (year=="2017"){
     LumiWeights_12 = new reweight::LumiReWeighting((datapath+"pu_distributions_mc_2017.root").c_str(), (datapath+"pu_distributions_data_2017.root").c_str(), "pua/#VBFHToTauTau_M125_13TeV_powheg_pythia8#RunIIFall17MiniAODv2-PU2017_12Apr2018_new_pmx_94X_mc2017_realistic_v14-v1#MINIAODSIM", "pileup");
     if (sample=="W1") LumiWeights_12 = new reweight::LumiReWeighting((datapath+"pu_distributions_mc_2017.root").c_str(), (datapath+"pu_distributions_data_2017.root").c_str(), "pua/#W1JetsToLNu_TuneCP5_13TeV-madgraphMLM-pythia8#RunIIFall17MiniAODv2-PU2017_12Apr2018_94X_mc2017_realistic_v14-v3#MINIAODSIM", "pileup");
     else if (sample=="W2") LumiWeights_12 = new reweight::LumiReWeighting((datapath+"pu_distributions_mc_2017.root").c_str(), (datapath+"pu_distributions_data_2017.root").c_str(), "pua/#W2JetsToLNu_TuneCP5_13TeV-madgraphMLM-pythia8#RunIIFall17MiniAODv2-PU2017_12Apr2018_94X_mc2017_realistic_v14-v5#MINIAODSIM", "pileup");
     else if (sample=="ST_t_antitop") LumiWeights_12 = new reweight::LumiReWeighting((datapath+"pu_distributions_mc_2017.root").c_str(), (datapath+"pu_distributions_data_2017.root").c_str(), "pua/#ST_t-channel_antitop_4f_inclusiveDecays_TuneCP5_13TeV-powhegV2-madspin-pythia8#RunIIFall17MiniAODv2-PU2017_12Apr2018_94X_mc2017_realistic_v14-v1#MINIAODSIM", "pileup");
     else if (sample=="DY4") LumiWeights_12 = new reweight::LumiReWeighting((datapath+"pu_distributions_mc_2017.root").c_str(), (datapath+"pu_distributions_data_2017.root").c_str(), "pua/#DY4JetsToLL_M-50_TuneCP5_13TeV-madgraphMLM-pythia8#RunIIFall17MiniAODv2-PU2017_12Apr2018_v2_94X_mc2017_realistic_v14-v2#MINIAODSIM", "pileup");
     else if (sample=="W") LumiWeights_12 = new reweight::LumiReWeighting((datapath+"pu_distributions_mc_2017.root").c_str(), (datapath+"pu_distributions_data_2017.root").c_str(), "pua/#WJetsToLNu_TuneCP5_13TeV-madgraphMLM-pythia8#RunIIFall17MiniAODv2-PU2017_12Apr2018_94X_mc2017_realistic_v14-v3#MINIAODSIM", "pileup");
     else if (sample=="DY") LumiWeights_12 = new reweight::LumiReWeighting((datapath+"pu_distributions_mc_2017.root").c_str(), (datapath+"pu_distributions_data_2017.root").c_str(), "pua/#DYJetsToLL_M-50_TuneCP5_13TeV-madgraphMLM-pythia8#RunIIFall17MiniAODv2-PU2017RECOSIMstep_12Apr2018_94X_mc2017_realistic_v14-v1#MINIAODSIM", "pileup");
     else if (sample=="WW") LumiWeights_12 = new reweight::LumiReWeighting((datapath+"pu_distributions_mc_2017.root").c_str(), (datapath+"pu_distributions_data_2017.root").c_str(), "pua/#WW_TuneCP5_13TeV-pythia8#RunIIFall17MiniAODv2-PU2017_12Apr2018_94X_mc2017_realistic_v14-v1#MINIAODSIM", "pileup");
     else if (sample=="WZ") LumiWeights_12 = new reweight::LumiReWeighting((datapath+"pu_distributions_mc_2017.root").c_str(), (datapath+"pu_distributions_data_2017.root").c_str(), "pua/#WZ_TuneCP5_13TeV-pythia8#RunIIFall17MiniAODv2-PU2017_12Apr2018_94X_mc2017_realistic_v14-v1#MINIAODSIM", "pileup");
     else if (sample=="DY4") LumiWeights_12 = new reweight::LumiReWeighting((datapath+"pu_distributions_mc_2017.root").c_str(), (datapath+"pu_distributions_data_2017.root").c_str(), "pua/#DY4JetsToLL_M-50_TuneCP5_13TeV-madgraphMLM-pythia8#RunIIFall17MiniAODv2-PU2017_12Apr2018_94X_mc2017_realistic_v14-v1#MINIAODSIM", "pileup");
     else if (sample=="ST_tW_top") LumiWeights_12 = new reweight::LumiReWeighting((datapath+"pu_distributions_mc_2017.root").c_str(), (datapath+"pu_distributions_data_2017.root").c_str(), "pua/#ST_tW_top_5f_inclusiveDecays_TuneCP5_13TeV-powheg-pythia8#RunIIFall17MiniAODv2-PU2017_12Apr2018_94X_mc2017_realistic_v14-v2#MINIAODSIM", "pileup");
     else if (sample=="WminusH125") LumiWeights_12 = new reweight::LumiReWeighting((datapath+"pu_distributions_mc_2017.root").c_str(), (datapath+"pu_distributions_data_2017.root").c_str(), "pua/#WminusHToTauTau_M125_13TeV_powheg_pythia8#RunIIFall17MiniAODv2-PU2017_12Apr2018_94X_mc2017_realistic_v14-v1#MINIAODSIM", "pileup");
     else if (sample=="ST_tW_antitop") LumiWeights_12 = new reweight::LumiReWeighting((datapath+"pu_distributions_mc_2017.root").c_str(), (datapath+"pu_distributions_data_2017.root").c_str(), "pua/#ST_tW_antitop_5f_inclusiveDecays_TuneCP5_13TeV-powheg-pythia8#RunIIFall17MiniAODv2-PU2017_12Apr2018_94X_mc2017_realistic_v14-v2#MINIAODSIM", "pileup");
     else if (sample=="W3") LumiWeights_12 = new reweight::LumiReWeighting((datapath+"pu_distributions_mc_2017.root").c_str(), (datapath+"pu_distributions_data_2017.root").c_str(), "pua/#W3JetsToLNu_TuneCP5_13TeV-madgraphMLM-pythia8#RunIIFall17MiniAODv2-PU2017_12Apr2018_94X_mc2017_realistic_v14-v1#MINIAODSIM", "pileup");
     else if (sample=="ZH125") LumiWeights_12 = new reweight::LumiReWeighting((datapath+"pu_distributions_mc_2017.root").c_str(), (datapath+"pu_distributions_data_2017.root").c_str(), "pua/#ZHToTauTau_M125_13TeV_powheg_pythia8#RunIIFall17MiniAODv2-PU2017_12Apr2018_94X_mc2017_realistic_v14-v1#MINIAODSIM", "pileup");
   }


   TFile *ftauid_2018 = new TFile((datapath+"TauID_SF_dm_DeepTau2017v2p1VSjet_2018ReReco.root").c_str());
   TFile *ftauid_2017 = new TFile((datapath+"TauID_SF_dm_DeepTau2017v2p1VSjet_2017ReReco.root").c_str());
   TFile *ftauid_2016 = new TFile((datapath+"TauID_SF_dm_DeepTau2017v2p1VSjet_2016Legacy.root").c_str());
   /*TH1F *fct_tauid_2018= (TH1F*) ftauid_2018->Get("Loose");
   TH1F *fct_tauid_2017= (TH1F*) ftauid_2017->Get("Loose");
   TH1F *fct_tauid_2016= (TH1F*) ftauid_2016->Get("Loose");*/
   TH1F *fct_tauid_2018= (TH1F*) ftauid_2018->Get("Medium");
   TH1F *fct_tauid_2017= (TH1F*) ftauid_2017->Get("Medium");
   TH1F *fct_tauid_2016= (TH1F*) ftauid_2016->Get("Medium");


   TFile fwmc((datapath+"htt_scalefactors_legacy_2018.root").c_str());
   RooWorkspace *wmc = (RooWorkspace*)fwmc.Get("w");
   fwmc.Close();
   if (year=="2017"){
      TFile fwmc((datapath+"htt_scalefactors_legacy_2017.root").c_str());
      wmc = (RooWorkspace*)fwmc.Get("w");
      fwmc.Close();
   }
   if (year=="2016"){
      TFile fwmc((datapath+"htt_scalefactors_legacy_2016.root").c_str());
      wmc = (RooWorkspace*)fwmc.Get("w");
      fwmc.Close();
   }


   TFile frawff("uncorrected_fakefactors_tt.root");
   TF1* ff_qcd_0jet=(TF1*) frawff.Get("rawFF_tt_qcd_0jetSSloose");
   TF1* ff_qcd_1jet=(TF1*) frawff.Get("rawFF_tt_qcd_1jetSSloose");
   TF1* ff_qcd_2jet=(TF1*) frawff.Get("rawFF_tt_qcd_2jetSSloose");

   TFile fmvisclosure ("FF_corrections_tt.root");
   TF1* mvisclosure_qcdloose=(TF1*) fmvisclosure.Get("closure_mvis_tt_qcdloose");

   TFile ftau2closure ("FF_corrections_1.root");
   TF1* tau2closure=(TF1*) ftau2closure.Get("closure_tau2pt_tt_qcdloose");

   //   TauTriggerSFs2017* etsf=new TauTriggerSFs2017(string(std::getenv("CMSSW_BASE"))+"/src/TauAnalysisTools/TauTriggerSFs/data/tauTriggerEfficiencies2018.root","ditau", "2018", "tight", "MVAv2");
   //   if (year=="2017") etsf=new TauTriggerSFs2017(string(std::getenv("CMSSW_BASE"))+"/src/TauAnalysisTools/TauTriggerSFs/data/tauTriggerEfficiencies2017.root","ditau", "2017", "loose", "MVAv2");
   //   else if (year=="2016") etsf=new TauTriggerSFs2017(string(std::getenv("CMSSW_BASE"))+"/src/TauAnalysisTools/TauTriggerSFs/data/tauTriggerEfficiencies2017.root","ditau", "2016", "tight", "MVAv2");
   using namespace tau_trigger;
   SFProvider* etsf=new SFProvider("~/CMSSW_10_2_15/src/TauAnalysisTools/TauTriggerSFs/data/2018_tauTriggerEff_DeepTau2017v2p1.root","ditau", "Medium");
   if (year=="2017") etsf=new SFProvider("~/CMSSW_10_2_15/src/TauAnalysisTools/TauTriggerSFs/data/2017_tauTriggerEff_DeepTau2017v2p1.root","ditau", "Medium");
   if (year=="2016") etsf=new SFProvider("~/CMSSW_10_2_15/src/TauAnalysisTools/TauTriggerSFs/data/2016_tauTriggerEff_DeepTau2017v2p1.root","ditau", "Medium");


   Int_t nentries_wtn = (Int_t) arbre->GetEntries();
   for (Int_t i = 0; i < nentries_wtn; i++) {
        arbre->GetEntry(i);
        if (i % 10000 == 0) fprintf(stdout, "\r  Processed events: %8d of %8d ", i, nentries_wtn);
        fflush(stdout);

	if (fabs(eta_1)>2.1) continue;
        if (fabs(eta_2)>2.1) continue;

        bool trigger=((passDoubleTightTau35TightID && pt_1>40 && pt_2>40) or (passDoubleMediumTau40TightID && pt_1>40 && pt_2>40) or (passDoubleTightTau40ID && pt_1>40 && pt_2>40));
        bool triggerHPS=(passDoubleMediumHPSTau35 && pt_1>40 && pt_2>40);
        bool trigger2016=((passDoubleTau35 or passDoubleTauCmb35) && pt_1>40 && pt_2>40);
        if (year=="2018" && sample=="data_obs" && run<317509 && !trigger) continue;
        if (year=="2018" && sample=="data_obs" && run>=317509 && !triggerHPS) continue;
        if (year=="2018" && sample!="data_obs" && !triggerHPS) continue;
        if (year=="2017" && !trigger) continue;
        if (year=="2016" && !trigger2016) continue;

        TLorentzVector mytau2;
        mytau2.SetPtEtaPhiM(pt_2,eta_2,phi_2,m_2);
        TLorentzVector mytau1;
        mytau1.SetPtEtaPhiM(pt_1,eta_1,phi_1,m_1);
        if (!byVVVLooseDeepVSe_2 or !byVLooseDeepVSmu_2 or !byVVVLooseDeepVSe_1 or !byVLooseDeepVSmu_1) continue;
        float signalRegion=(byMediumDeepVSjet_1);
        float antiisoRegion=(byVVVLooseDeepVSjet_1 && !byMediumDeepVSjet_1);
        float iso2=(byMediumDeepVSjet_2);
	int mydm1=l1_decayMode;
        int mydm2=l2_decayMode;
        float gen1=gen_match_1;
        float gen2=gen_match_2;

        if (pt_2>pt_1){
            mytau2.SetPtEtaPhiM(pt_1,eta_1,phi_1,m_1);
            mytau1.SetPtEtaPhiM(pt_2,eta_2,phi_2,m_2);
            signalRegion=(byMediumDeepVSjet_2);
            antiisoRegion=(byVVVLooseDeepVSjet_2 && !byMediumDeepVSjet_2);
            iso2=byMediumDeepVSjet_1;
	    mydm2=l1_decayMode;
	    mydm1=l2_decayMode;
            gen1=gen_match_2;
            gen2=gen_match_1;
	}

        /*float signalRegion=(byLooseDeepVSjet_1);
        float antiisoRegion=(byVVVLooseDeepVSjet_1 && !byLooseDeepVSjet_1);
        float iso2=(byLooseDeepVSjet_2);
        int mydm1=l1_decayMode;
        int mydm2=l2_decayMode;
        float gen1=gen_match_1;
        float gen2=gen_match_2;

        if (pt_2>pt_1){
            mytau2.SetPtEtaPhiM(pt_1,eta_1,phi_1,m_1);
            mytau1.SetPtEtaPhiM(pt_2,eta_2,phi_2,m_2);
            signalRegion=(byLooseDeepVSjet_2);
            antiisoRegion=(byVVVLooseDeepVSjet_2 && !byLooseDeepVSjet_2);
            iso2=byLooseDeepVSjet_1;
            mydm2=l1_decayMode;
            mydm1=l2_decayMode;
            gen1=gen_match_2;
            gen2=gen_match_1;
        }*/

	if (mytau1.DeltaR(mytau2)<0.5) continue;

        if (year=="2018"){
           if (sample=="W"){
               weight=51.542;
               if (numGenJets==1) weight=9.0452;
               else if (numGenJets==2) weight=4.4927;
               else if (numGenJets==3) weight=3.0651;
               else if (numGenJets==4) weight=3.1984;
           }
           if (sample=="DY"){
               weight=3.62347;
               if (numGenJets==1) weight=0.62980;
               else if (numGenJets==2) weight=0.55213;
               else if (numGenJets==3) weight=0.5995;
               else if (numGenJets==4) weight=0.82114;
           }
        }
        else if (year=="2017"){
           if (sample=="W"){
               weight=23.8336;
               if (numGenJets==1) weight=3.1468;
               else if (numGenJets==2) weight=4.087;
               else if (numGenJets==3) weight=2.253;
               else if (numGenJets==4) weight=2.1954;
           }
           if (sample=="DY"){
               weight=2.5805;
               if (numGenJets==1) weight=0.71000;
               else if (numGenJets==2) weight=0.921125;
               else if (numGenJets==3) weight=1.6508;
               else if (numGenJets==4) weight=0.21935;
           }
        }
        else if (year=="2016"){
           if (sample=="W"){
               weight=25.3918;
               if (numGenJets==1) weight=5.76634;
               else if (numGenJets==2) weight=1.7906;
               else if (numGenJets==3) weight=0.67907;
               else if (numGenJets==4) weight=1.9645;
           }
           if (sample=="DY"){
               weight=1.49237;
               if (numGenJets==1) weight=0.47595;
               else if (numGenJets==2) weight=0.49308;
               else if (numGenJets==3) weight=0.50555;
               else if (numGenJets==4) weight=0.41466;
           }
        }

        bool is_includedInEmbedded=false;
        //if ((name.find("125")>100 && sample!="data_obs" && sample!="embedded") && gen_match_1>2 && gen_match_1<6 && gen_match_2>2 && gen_match_2<6) is_includedInEmbedded=true; // remove overlap with embedded samples
        bool isT=(!is_includedInEmbedded && gen1==5);
        bool isL=(!is_includedInEmbedded && gen1<5);

        float aweight=genweight*weight*LumiWeights_12->weight(npu);
        if (sample=="embedded") aweight=genweight;

        float dm1=l1_decayMode;
        float dm2=l2_decayMode;
        if (dm1>10) dm1=10;
        if (dm2>10) dm2=10;
        int bin1=fct_tauid_2018->GetXaxis()->FindBin(dm1);
        int bin2=fct_tauid_2018->GetXaxis()->FindBin(dm2);
        if (year=="2018" && byMediumDeepVSjet_1 && sample!="embedded" && sample!="data_obs" && gen_match_1==5) aweight=aweight*fct_tauid_2018->GetBinContent(bin1);
        if (year=="2017" && byMediumDeepVSjet_1 && sample!="embedded" && sample!="data_obs" && gen_match_1==5) aweight=aweight*fct_tauid_2017->GetBinContent(bin1);
        if (year=="2016" && byMediumDeepVSjet_1 && sample!="embedded" && sample!="data_obs" && gen_match_1==5) aweight=aweight*fct_tauid_2016->GetBinContent(bin1);
        if (year=="2018" && byMediumDeepVSjet_2 && sample!="embedded" && sample!="data_obs" && gen_match_2==5) aweight=aweight*fct_tauid_2018->GetBinContent(bin2);
        if (year=="2017" && byMediumDeepVSjet_2 && sample!="embedded" && sample!="data_obs" && gen_match_2==5) aweight=aweight*fct_tauid_2017->GetBinContent(bin2);
        if (year=="2016" && byMediumDeepVSjet_2 && sample!="embedded" && sample!="data_obs" && gen_match_2==5) aweight=aweight*fct_tauid_2016->GetBinContent(bin2);

        /*if (year=="2018" && byLooseDeepVSjet_1 && sample!="embedded" && sample!="data_obs" && gen_match_1==5) aweight=aweight*fct_tauid_2018->GetBinContent(bin1);
        if (year=="2017" && byLooseDeepVSjet_1 && sample!="embedded" && sample!="data_obs" && gen_match_1==5) aweight=aweight*fct_tauid_2017->GetBinContent(bin1);
        if (year=="2016" && byLooseDeepVSjet_1 && sample!="embedded" && sample!="data_obs" && gen_match_1==5) aweight=aweight*fct_tauid_2016->GetBinContent(bin1);
        if (year=="2018" && byLooseDeepVSjet_2 && sample!="embedded" && sample!="data_obs" && gen_match_2==5) aweight=aweight*fct_tauid_2018->GetBinContent(bin2);
        if (year=="2017" && byLooseDeepVSjet_2 && sample!="embedded" && sample!="data_obs" && gen_match_2==5) aweight=aweight*fct_tauid_2017->GetBinContent(bin2);
        if (year=="2016" && byLooseDeepVSjet_2 && sample!="embedded" && sample!="data_obs" && gen_match_2==5) aweight=aweight*fct_tauid_2016->GetBinContent(bin2);*/


	TLorentzVector mymet;
	mymet.SetPtEtaPhiM(met,0,metphi,0);

	if (sample=="data_obs") aweight=1.0;

	// Top pT reweighting
        float topfactor=1.0;
        if (name=="TT"){
           float pttop1=pt_top1;
           if (pttop1>400) pttop1=400;
           float pttop2=pt_top2;
           if (pttop2>400) pttop2=400;
           topfactor=sqrt(exp(0.0615-0.0005*pttop1)*exp(0.0615-0.0005*pttop2));
           aweight*=topfactor;
        }

        float zptweight=1.0;
	if (sample!="embedded" && sample!="data_obs"){ // same for all years
          wmc->var("z_gen_mass")->setVal(genM);
          wmc->var("z_gen_pt")->setVal(genpT);
	  zptweight=wmc->function("zptmass_weight_nom")->getVal();
	  if (sample=="DY") aweight=aweight*zptweight;
          if (mydm1>10) mydm1=10;
          if (mydm2>10) mydm2=10;
	  //aweight=aweight*etsf->getTriggerScaleFactor(mytau1.Pt(), mytau1.Eta(), mytau1.Phi(), mydm1)*etsf->getTriggerScaleFactor(mytau2.Pt(), mytau2.Eta(), mytau2.Phi(), mydm2);
	  aweight=aweight*etsf->getSF(mytau1.Pt(), mydm1,0)*etsf->getSF(mytau2.Pt(), mydm2,0);
	}

	//************************* Fill histograms **********************
	   float weight2=1.0;
	   float myvar=(mytau1+mytau2).M();

	  float ff_qcd=get_raw_FF(mytau1.Pt(),ff_qcd_0jet);//*get_mvis_closure(mytau2.Pt(),tau2closure);//*get_mvis_closure((myele+mytau).M(),mvisclosure_qcdloose);
	  if (njets==1) ff_qcd=get_raw_FF(mytau1.Pt(),ff_qcd_1jet);//*get_mvis_closure(mytau2.Pt(),tau2closure);//*get_mvis_closure((myele+mytau).M(),mvisclosure_qcdloose);
	  else if (njets>1) ff_qcd=get_raw_FF(mytau1.Pt(),ff_qcd_2jet);

           if (!is_includedInEmbedded){

	     if (isL or isT){
	       if (signalRegion && !iso2 && q_1*q_2<0)
		  h0LT_qcd_iso->Fill(myvar,aweight*weight2);
               if (antiisoRegion && !iso2 && q_1*q_2<0)
                  h0LT_qcd_anti->Fill(myvar,aweight*weight2*ff_qcd);

	    }
	   else{
               if (signalRegion && !iso2 && q_1*q_2<0)
                  h0J_qcd_iso->Fill(myvar,aweight*weight2);
               if (antiisoRegion && !iso2 && q_1*q_2<0)
                  h0J_qcd_anti->Fill(myvar,aweight*weight2*ff_qcd);
            }
           }

    } // end of loop over events
    TFile *fout = TFile::Open(output.c_str(), "RECREATE");
    fout->cd();

    TString postfixJ="J";
    TString postfixLT="LT";

    TDirectory *d0_qcd_iso =fout->mkdir("tt_0jet_qcd_iso");
    d0_qcd_iso->cd();
    if (sample=="data_obs" or sample=="W"){
      h0LT_qcd_iso->SetName(name.c_str());
      h0LT_qcd_iso->Add(h0J_qcd_iso);
      h0LT_qcd_iso->Write();
    }
    else{
      h0LT_qcd_iso->SetName(name.c_str()+postfixLT);
      h0LT_qcd_iso->Write();
      h0J_qcd_iso->SetName(name.c_str()+postfixJ);
      h0J_qcd_iso->Write();
    }

    TDirectory *d0_qcd_anti =fout->mkdir("tt_0jet_qcd_anti");
    d0_qcd_anti->cd();

    if (sample=="data_obs" or sample=="W"){
      h0LT_qcd_anti->SetName(name.c_str());
      h0LT_qcd_anti->Add(h0J_qcd_anti);
      h0LT_qcd_anti->Write();
    }
    else{
      h0LT_qcd_anti->SetName(name.c_str()+postfixLT);
      h0LT_qcd_anti->Write();
      h0J_qcd_anti->SetName(name.c_str()+postfixJ);
      h0J_qcd_anti->Write();
    }

    fout->Close();
    delete wmc;
} 



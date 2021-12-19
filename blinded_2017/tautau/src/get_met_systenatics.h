TLorentzVector tautau_analyzer::metSysUnc(string uncType, TLorentzVector event_metP4){
  
  TLorentzVector mymetvector = event_metP4;
  //TLorentzVector mymetvector;
  //mymetvector.SetPtEtaPhiE(pfMET,0 ,pfMETPhi ,pfMET);
  TLorentzVector BosonP4, nuP4, nuP4tmp;
  TLorentzVector nu1P4, gentau1P4;
  TLorentzVector nu2P4, gentau2P4;
  TLorentzVector visGenP4;
  for(int i=0; i<nMC; i++)
    {
      if(mcPID->at(i)==23)
	BosonP4.SetPtEtaPhiE(mcPt->at(i), mcEta->at(i) , mcPhi->at(i) , mcE->at(i) );
    }
  //visGenP4=BosonP4;
  if(BosonP4.Pt()==0)
    {
      for(int i=0; i<nMC; i++)
	{
	  if(mcPID->at(i)==15)
	    gentau1P4.SetPtEtaPhiE(mcPt->at(i), mcEta->at(i) , mcPhi->at(i) , mcE->at(i) );
	  if(mcPID->at(i)==-15)
	    gentau2P4.SetPtEtaPhiE(mcPt->at(i), mcEta->at(i) , mcPhi->at(i) , mcE->at(i) );
	}
      BosonP4=gentau1P4+gentau2P4;
    }
  visGenP4=BosonP4;
  for(int i=0; i<nMC; i++)
    {
      if(abs(mcPID->at(i))==16 || abs(mcPID->at(i))==14 || abs(mcPID->at(i))==12)
	{
	  nuP4tmp.SetPtEtaPhiE(mcPt->at(i), mcEta->at(i) , mcPhi->at(i) , mcE->at(i) );
	  visGenP4=visGenP4-nuP4tmp;
	}
    }
  // apply recoil corrections on event-by-event basis (Type I PF MET)
  float pfmet=mymetvector.Pt(); float pfmetPhi=mymetvector.Phi();
  float pfmetcorr_ex_responseUp=0;     float pfmetcorr_ey_responseUp=0;
  float pfmetcorr_ex_responseDown=0;   float pfmetcorr_ey_responseDown=0;
  float pfmetcorr_ex_resolutionUp=0;   float pfmetcorr_ey_resolutionUp=0;
  float pfmetcorr_ex_resolutionDown=0; float pfmetcorr_ey_resolutionDown=0;
  float genpX = BosonP4.Px();
  float genpY = BosonP4.Py();
  float vispX = visGenP4.Px();
  float vispY = visGenP4.Py();
  int recoiljets = my_njets;
  int Process= MEtSys::ProcessType::BOSON;
  metSys.ApplyMEtSys(mymetvector.Px(),mymetvector.Py(),
		     genpX,genpY,
		     vispX,vispY,
		     recoiljets,
		     Process,
		     MEtSys::SysType::Response,
		     MEtSys::SysShift::Up,
		     pfmetcorr_ex_responseUp,pfmetcorr_ey_responseUp
		     );

  metSys.ApplyMEtSys(mymetvector.Px(),mymetvector.Py(),
		     genpX,genpY,
		     vispX,vispY,
		     recoiljets,
		     Process,
		     MEtSys::SysType::Response,
		     MEtSys::SysShift::Down,
		     pfmetcorr_ex_responseDown,pfmetcorr_ey_responseDown
		     );

  metSys.ApplyMEtSys(mymetvector.Px(),mymetvector.Py(),
		     genpX,genpY,
		     vispX,vispY,
		     recoiljets,
		     Process,
		     MEtSys::SysType::Resolution,
		     MEtSys::SysShift::Up,
		     pfmetcorr_ex_resolutionUp,pfmetcorr_ey_resolutionUp
		     );
  metSys.ApplyMEtSys(mymetvector.Px(),mymetvector.Py(),
		     genpX,genpY,
		     vispX,vispY,
		     recoiljets,
		     Process,
		     MEtSys::SysType::Resolution,
		     MEtSys::SysShift::Down,
		     pfmetcorr_ex_resolutionDown,pfmetcorr_ey_resolutionDown
		     );
  // cout<<" ********************************************"<<endl;
  // cout<<"nominal    "<<" "<<mymetvector.Px()<<"  "<<mymetvector.Py()<<endl;
  // cout <<"response"<<"\n"<<" "<<pfmetcorr_ex_responseUp<<" "<<pfmetcorr_ex_responseDown<<endl;
  // cout <<"response"<<"\n"<<" "<<pfmetcorr_ey_responseUp<<" "<<pfmetcorr_ey_responseDown<<endl;
  // cout <<"resolution"<<"\n"<<" "<<pfmetcorr_ex_resolutionUp<<" "<<pfmetcorr_ex_resolutionDown<<endl;
  // cout <<"resolution"<<"\n"<<" "<<pfmetcorr_ey_resolutionUp<<" "<<pfmetcorr_ey_resolutionDown<<endl;
  string njetName ="";
  // if (recoiljets ==0) njetName="0";
  // else if (recoiljets ==1) njetName="1";
  // else if (recoiljets >=2) njetName="2";
  TLorentzVector mymet_responseUp, mymet_responseDown, mymet_resolutionUp, mymet_resolutionDown ;
  if (unc_shift == "up" && uncType=="response")
    {
      mymet_responseUp.SetPxPyPzE(pfmetcorr_ex_responseUp,pfmetcorr_ey_responseUp,0,sqrt(pfmetcorr_ex_responseUp*pfmetcorr_ex_responseUp+pfmetcorr_ey_responseUp*pfmetcorr_ey_responseUp));
      return mymet_responseUp;
    }
  else if (unc_shift == "up" && uncType=="resolution")
    {
      mymet_resolutionUp.SetPxPyPzE(pfmetcorr_ex_resolutionUp,pfmetcorr_ey_resolutionUp,0,sqrt(pfmetcorr_ex_resolutionUp*pfmetcorr_ex_resolutionUp+pfmetcorr_ey_resolutionUp*pfmetcorr_ey_resolutionUp));
      return mymet_resolutionUp;
    }
  else if (unc_shift == "down" && uncType=="response")
    {
      mymet_responseDown.SetPxPyPzE(pfmetcorr_ex_responseDown,pfmetcorr_ey_responseDown,0,sqrt(pfmetcorr_ex_responseDown*pfmetcorr_ex_responseDown+pfmetcorr_ey_responseDown*pfmetcorr_ey_responseDown));
      return mymet_responseDown;
    }
  else if (unc_shift == "down" && uncType=="resolution")
    {
      mymet_resolutionDown.SetPxPyPzE(pfmetcorr_ex_resolutionDown,pfmetcorr_ey_resolutionDown,0,sqrt(pfmetcorr_ex_resolutionDown*pfmetcorr_ex_resolutionDown+pfmetcorr_ey_resolutionDown*pfmetcorr_ey_resolutionDown));
      return mymet_resolutionDown;
    }
  
}

TLorentzVector tautau_analyzer::metClusteredUnc( ){
    TLorentzVector new_metP4;
  double met_up_to_use = abs(pfMET-pfMET_T1UESUp) + pfMET;
  double met_do_to_use = pfMET - abs(pfMET-pfMET_T1UESDo) ;
  if(unc_shift=="up")
    new_metP4.SetPtEtaPhiE( met_up_to_use, 0, pfMETPhi_T1UESUp, met_up_to_use);
  else if(unc_shift=="down")
    new_metP4.SetPtEtaPhiE( met_do_to_use, 0, pfMETPhi_T1UESDo, met_do_to_use);
  else 
    new_metP4.SetPtEtaPhiE(pfMET ,0,pfMETPhi,pfMET);
  return new_metP4;

}

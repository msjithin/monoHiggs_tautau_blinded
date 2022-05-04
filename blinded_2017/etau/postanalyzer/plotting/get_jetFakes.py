#!/usr/bin/env python
import ROOT
import re
from array import array
import sys
import csv
from math import sqrt
from math import pi
import datetime
import argparse
# from sys import path
# path.append("../../../MacrosAndScripts/")
# from myPlotStyle import *
ROOT.gStyle.SetFrameLineWidth(1)
ROOT.gStyle.SetLineWidth(2)
ROOT.gStyle.SetOptStat(0)
#mc_samples = ['ZTTjet', 'EWKWMinus', 'EWKWPlus', 'EWKZ2Jets', 'GluGluH', 'GluGluZH', 'HWminusJ', 'HWplusJ', 'HZJ', 'ST_t', 'TT', 'VBFH', 'WGToLNuG', 'VV', 'VVV', 'WplusH', 'ZH', 'ZJetsToNuNu']
mc_samples = ['ZTTjet', 'ZLLjet', 'TT', 'otherMC', 'STT', 'VVT']

        
def checkHistogram(f, histogram):
    isthere=  f.GetListOfKeys().Contains(histogram)
    #print(isthere)
    return isthere


def GetKeyNames( self, dir = "" ):
    self.cd(dir)
    return [key.GetName() for key in ROOT.gDirectory.GetListOfKeys()]
ROOT.TFile.GetKeyNames = GetKeyNames

def getHistList(inFile):
    keyList = inFile.GetKeyNames()
    #print "\nKeys in file:", keyList
    tmpList= []
    for tdir in keyList:
        if "_fr" not in tdir: continue
        if "CMS_htt_boson" in tdir : continue
        jetFakes = inFile.Get(tdir+'/'+'data_obs_'+tdir)
        print 'integral  data_obs', jetFakes.Integral()
        for mc in mc_samples:
            tmppath = tdir+'/'+mc+'_'+tdir
            try:
                tmpHist = inFile.Get(tmppath)
                jetFakes.Add(tmpHist, -1)
            except:
                pass
        print 'integral  jetFakes', jetFakes.Integral()
        tdir = tdir.replace('_fr', '')
        inFile.cd(tdir)
        jetFakes.SetName("jetFakes_"+tdir)
        jetFakes.Write()
        
    return 


def main(histogram):
    inFile_nominal= ROOT.TFile("f_"+histogram+"_initial.root","UPDATE")
    getHistList(inFile_nominal)
    inFile_nominal.Close()
    

if __name__=="__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--hist",
                    help="name of histogram elePt , tauPt, ..  Default=etau")
    args =  parser.parse_args()
    if args.hist is None:
        histogram = 'etau'
    else:
        histogram = args.hist
    print 'histogram = ' , histogram
    main(histogram)



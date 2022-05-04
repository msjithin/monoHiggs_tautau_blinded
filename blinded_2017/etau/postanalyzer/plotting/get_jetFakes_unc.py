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
# mc_samples = ['ZTTjet', 'EWKWMinus', 'EWKWPlus', 'EWKZ2Jets', 'GluGluH', 'GluGluZH', 'HWminusJ', 'HWplusJ', 'HZJ', 'ST_t', 'TT', 'VBFH', 'WGToLNuG', 'VV', 'VVV', 'WplusH', 'ZH', 'ZJetsToNuNu']
mc_samples = ['ZTTjet', 'TT', 'otherMC', 'STT', 'VVT']
        
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
        if "FF" not in tdir: continue
        #if "_9" not in tdir: continue
        if "CMS_htt_boson" in tdir : continue
        # if "tauh_ID" not in tdir : continue
        print '\n***************************     tdir  =  ', tdir
        jetFakes = inFile.Get(tdir+'/'+'data_obs_'+tdir).Clone()
        #jetFakes.Reset("ICES")
        print 'data integral = ', jetFakes.Integral()
        for mc in mc_samples:
            tmppath = tdir+'/'+mc+'_'+tdir
            tmpHist = inFile.Get(tmppath)
            #print tdir+'/'+mc+'_'+tdir
            #print '             intergal = ', tmpHist.Integral()
            jetFakes.Add(tmpHist, -1)
            
        print 'integral  jetFakes', jetFakes.Integral()
        inFile.cd(tdir)
        jetFakes.SetName("jetFakes_"+tdir)
        print "hist written to ", tdir , "jetFakes_"+tdir
        jetFakes.Write()
        # for plotting
        # tdir = tdir.replace('_fr', '')
        # inFile.cd(tdir)
        # jetFakes.SetName("jetFakes_"+tdir)
        # print "hist written to ", tdir , "jetFakes_"+tdir
        # jetFakes.Write()
        
    return 
    

def main(histogram):
    inFile_up     = ROOT.TFile("f_"+histogram+"_up.root","UPDATE")
    inFile_down   = ROOT.TFile("f_"+histogram+"_down.root","UPDATE")
    getHistList(inFile_up)
    inFile_up.Close()
    getHistList(inFile_down)
    inFile_down.Close()


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


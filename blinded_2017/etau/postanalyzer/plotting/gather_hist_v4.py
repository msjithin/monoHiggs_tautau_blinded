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
#mc_samples = ['jetFakes', 'ZTTjet', 'ZLLjet', 'EWKWMinus', 'EWKWPlus', 'EWKZ2Jets', 'GluGluH', 'GluGluZH', 'HWminusJ', 'HWplusJ', 'HZJ', 'ST_t', 'TT', 'VBFH', 'WGToLNuG', 'VV', 'VVV', 'WplusH', 'ZH', 'ZJetsToNuNu' , 
              # 'signal_MH3_200_MH4_100', 'signal_MH3_200_MH4_150', 'signal_MH3_300_MH4_100', 'signal_MH3_300_MH4_150', 'signal_MH3_400_MH4_100', 'signal_MH3_400_MH4_150', 'signal_MH3_400_MH4_200', 'signal_MH3_400_MH4_250', 'signal_MH3_500_MH4_150', 'signal_MH3_500_MH4_200', 'signal_MH3_500_MH4_250', 'signal_MH3_500_MH4_300', 'signal_MH3_600_MH4_100', 'signal_MH3_600_MH4_150', 'signal_MH3_600_MH4_200', 'signal_MH3_600_MH4_250', 'signal_MH3_600_MH4_300', 'signal_MH3_600_MH4_350', 'signal_MH3_600_MH4_400', 'signal_MH3_600_MH4_500', 'signal_MH3_700_MH4_250', 'signal_MH3_700_MH4_300', 'signal_MH3_700_MH4_350', 'signal_MH3_700_MH4_400', 'signal_MH3_800_MH4_250', 'signal_MH3_800_MH4_300', 'signal_MH3_800_MH4_350', 'signal_MH3_800_MH4_500', 'signal_MH3_900_MH4_300', 'signal_MH3_900_MH4_350', 'signal_MH3_900_MH4_400', 'signal_MH3_900_MH4_500']
mc_samples = ['jetFakes', 'ZTTjet', 'ZLLjet', 'TT' , 'otherMC' , 'STT', 'VVT']
signal_samples=['MH3_200_MH4_100', 'MH3_200_MH4_150', 'MH3_300_MH4_100', 'MH3_300_MH4_150', 'MH3_400_MH4_100', 'MH3_400_MH4_150', 'MH3_400_MH4_200', 'MH3_400_MH4_250', 'MH3_500_MH4_150', 'MH3_500_MH4_200', 'MH3_500_MH4_250', 'MH3_500_MH4_300', 'MH3_600_MH4_100', 'MH3_600_MH4_150', 'MH3_600_MH4_200', 'MH3_600_MH4_250', 'MH3_600_MH4_300', 'MH3_600_MH4_350', 'MH3_600_MH4_400', 'MH3_600_MH4_500', 'MH3_700_MH4_250', 'MH3_700_MH4_300', 'MH3_700_MH4_350', 'MH3_700_MH4_400', 'MH3_800_MH4_250', 'MH3_800_MH4_300', 'MH3_800_MH4_350', 'MH3_800_MH4_500', 'MH3_900_MH4_300', 'MH3_900_MH4_350', 'MH3_900_MH4_400', 'MH3_900_MH4_500']


channelName = 'etau'
outFile =  ROOT.TFile('etau_tmass200.root',"UPDATE")
        
def checkHistogram(f, histogram):
    isthere=  f.GetListOfKeys().Contains(histogram)
    #print(isthere)
    return isthere


def GetKeyNames( self, dir = "" ):
    self.cd(dir)
    return [key.GetName() for key in ROOT.gDirectory.GetListOfKeys()]
ROOT.TFile.GetKeyNames = GetKeyNames

def getLabel(name):
    label = name
    label = label.replace('tot_TMass_9', '')
    label = label.replace('_down1', 'Down')
    label = label.replace('_up1', 'Up')
    label = label.replace('_down', 'Down')
    label = label.replace('_up', 'Up')
    label = label.replace('_Down', 'Down')
    label = label.replace('_Up', 'Up')
    if '_fr' in label:
        label = label.replace('_fr', '')
    return label

def getHistList(inFile):
    keyList = inFile.GetKeyNames()
    #print "\nKeys in file:", keyList
    tmpList= []
    channel = channelName
    outFile.cd()
    if not outFile.GetDirectory(channel):
        outFile.mkdir(channel)
    outFile.cd(channel)


    for tdir in keyList:
        if 'tot_TMass' not in tdir : continue
        if '_9' not in tdir: continue
        if "_dyll" in tdir: continue
        if tdir == 'tot_TMass_9':
            data = inFile.Get(tdir+'/data_obs_'+tdir)
            data.SetName('data_obs')
            outFile.cd(channel)
            data.Write()
        for signal in signal_samples:
            if inFile.Get(tdir+'/signal_'+signal+'_'+tdir) and '_fr' not in tdir:
                signalhist = inFile.Get(tdir+'/signal_'+signal+'_'+tdir)
                signalhist.SetName( signal + getLabel(tdir))
                signalhist.Write()
        for mc in mc_samples:
            if mc != 'jetFakes' and '_fr' in tdir:
                continue
            tmppath = tdir+'/'+mc+'_'+tdir
            try:
                tmpHist = inFile.Get(tmppath)
                tmpHist.SetName(mc + getLabel(tdir))
                tmpHist.Write()
            except:
                pass
                

    return tmpList


# inFile_nominal= ROOT.TFile("f_mutau_initial.root","UPDATE")
histname = "tot_TMass"
file_list = ["f_"+histname+"_initial.root", "f_"+histname+"_up.root", "f_"+histname+"_down.root"]

for fname in file_list:
    rootfile = ROOT.TFile(fname,"READ")
    print(getHistList(rootfile))
    rootfile.Close()
    


outFile.Close()

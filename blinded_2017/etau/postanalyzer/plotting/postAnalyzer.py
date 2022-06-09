#!/usr/bin/env python
import ROOT
from array import array
from sys import exit
from os import listdir
import re
import argparse
import lumi_weights_2017 as lumi
import argparse
from main import var_mapping


def GetKeyNames( self, dir = "" ):
    self.cd(dir)
    return [key.GetName() for key in ROOT.gDirectory.GetListOfKeys()]
ROOT.TFile.GetKeyNames = GetKeyNames

def getSaveName(histName):
    position = re.search(r"\d", histName)
    saveName = ""
    if position:
        saveName =  histName[: position.start()-1] if histName[position.start()-1]=="_" else histName[: position.start()+1]
    else:
        saveName =  histName
    if 'up' in histName:
        saveName += "_up"
    elif 'down' in histName:
        saveName += "_down"
    return saveName

def getHistList(sampleName = "", hist_name=""):
    inFile= ROOT.TFile("../files_initial/"+sampleName,"r")
    keyList = inFile.GetKeyNames()
    print "{} histograms in file {}".format(sampleName, len(keyList))
    hist_mapping = { }
    for hist in keyList:
        if hist_name not in hist: continue
        saveName = getSaveName(hist)
        if saveName in hist_mapping:
            hist_mapping[saveName].append(hist)
        else:
            hist_mapping[saveName] = [hist]
    
    inFile.Close()
    if not hist_mapping:
        print('\nrequested histogram name not in file....................')
    return hist_mapping
    

def make_files(sampleName = "", hist_name=""):
    inFile= ROOT.TFile("../files_initial/"+sampleName,"r")
    nEventsHisto = inFile.Get("nEvents")
    if not isinstance(nEventsHisto, ROOT.TH1F):
        print 'nEvents not found in ' "../files_initial/"+sampleName
        return 
    nGeneratedEvents = nEventsHisto.GetBinContent(1)
    weight, saveName= lumi.get_lumiweight(sampleName[:-11], nGeneratedEvents)
    
    hist_mapping =  getHistList(sampleName, hist_name)
    print ""
    #print hist_mapping.keys()
    print ""
     
    for key in hist_mapping:
        outFile = ROOT.TFile("sample/"+sampleName[:-5]+'_'+key+'.root' ,  "UPDATE")
        #print 'in file ', "sample/"+sampleName[:-5]+'_'+key+'.root'
        for histName in hist_mapping[key]:
            outFile.cd()
            tmpHist =  inFile.Get(histName)
            if not outFile.GetDirectory(histName):
                outFile.mkdir(histName)
            outFile.cd(histName)
            tmpHist.Scale(weight)
            tmpHist.Write(saveName+"_"+histName)
        outFile.Close()
    inFile.Close()


def main(idx):
    path = "../files_initial/"
    f_list = sorted(listdir(path))
    

    print " "

    for infile in f_list:
        #check_integral(infile)
        if '.root' not in infile: continue
        print "Making root files for "+var_mapping[int(idx)]
        make_files(infile , var_mapping[int(idx)])
    

if __name__=="__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-idx",
                    help="index of hist to be plotted,  example -idx 4   or -idx 4,5,12,11 ")
    
    args =  parser.parse_args()
    if args.idx is None:
        print "No index passed"
        exit('No index passed..............')
    main(args.idx)

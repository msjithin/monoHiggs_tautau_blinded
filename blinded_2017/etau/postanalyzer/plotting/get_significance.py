#!/usr/bin/env python
import ROOT
import re
from array import array
from sys import argv
import ROOT as Root
import csv
from math import sqrt
from math import pi
import datetime
import argparse
from ngen import signal_list

def GetKeyNames( self, dir = "" ):
    self.cd(dir)
    return [key.GetName() for key in ROOT.gDirectory.GetListOfKeys()]
ROOT.TFile.GetKeyNames = GetKeyNames


tdir_1 = 'deltaR_9'
tdir_2 = 'deltaR_9b'

mc_bkgs = ['ZTTjet', 'TT', 'jetFakes', 'STT', 'VVT', 'otherMC']
inFile = ROOT.TFile('f_deltaR_initial.root', 'r')


all_bkg_1 = inFile.Get(tdir_1 + '/' + mc_bkgs[0] + '_' + tdir_1 )
all_bkg_2 = inFile.Get(tdir_2 + '/' + mc_bkgs[0] + '_' + tdir_2 )

print "______________________"
print "Without dr<2.0"
for mc in mc_bkgs:
    tmp = inFile.Get(tdir_1 + '/' + mc + '_' + tdir_1 )
    print mc+' ' , tmp.Integral()

print "______________________"
print "With dr<2.0"
for mc in mc_bkgs:
    tmp = inFile.Get(tdir_2 + '/' + mc + '_' + tdir_2 )
    print mc+' ' , tmp.Integral()
print ""


for mc in mc_bkgs[1:]:
    tmp = inFile.Get(tdir_1 + '/' + mc + '_' + tdir_1 )
    print mc+' ' , tmp.Integral()
    all_bkg_1.Add(tmp)


for mc in mc_bkgs[1:]:
    tmp = inFile.Get(tdir_2 + '/' + mc + '_' + tdir_2 )
    print mc+' ' , tmp.Integral()
    all_bkg_2.Add(tmp)

print "______________________"
print "Sum of all bkgs without dr<2.0 ", all_bkg_1.Integral()
print "Sum of all bkgs with dr<2.0    " , all_bkg_2.Integral()
print "______________________"
sum1 = all_bkg_1.Integral()
sum2 = all_bkg_2.Integral()


keyList = inFile.GetKeyNames(tdir_1)

signal_2hdma = []
for hist in keyList:
    if '2HDMa_gg_sinp_0p35_tanb_1p0_mXd_10' in hist:
        hist = hist.replace('_deltaR_9', '')
        ma = int(hist.split('_')[-1])
        if ma != 100 : continue
        signal_2hdma.append(hist)

signal_zprime = []
for hist in keyList:
    if 'MZp_' in hist:
        hist = hist.replace('_deltaR_9', '')
        mchi = int(hist.split('_')[-1])
        if mchi != 1: continue
        signal_zprime.append(hist)   



signal_2hdma = sorted(signal_2hdma, key= lambda x : int(x.split('_')[-3]) )
signal_zprime = sorted(signal_zprime, key= lambda x : int(x.split('_')[-3]) )

print signal_2hdma
print signal_zprime

s_sqrtb = [ ]

print "Signal \t\t\t\t s/sqrt(b) without dr<2.0 cut        \t  s/sqrt(b) with dr<2.0 cut"
for s in signal_2hdma:
    tmp_1 = inFile.Get(tdir_1 + '/' + s + '_' + tdir_1 )
    tmp_2 = inFile.Get(tdir_2 + '/' + s + '_' + tdir_2 )

    sig_1 = round( tmp_1.Integral() / sqrt(sum1), 3)
    sig_2 = round(tmp_2.Integral() / sqrt(sum2) , 3)
    s_sqrtb.append((s , sig_1, sig_2))
    print  "{}\t\t{}\t\t{} ".format(s, sig_1, sig_2)

print ""
print "Signal \t s/sqrt(b) without dr<2.0 cut        \t  s/sqrt(b) with dr<2.0 cut"
for s in signal_zprime:
    tmp_1 = inFile.Get(tdir_1 + '/' + s + '_' + tdir_1 )
    tmp_2 = inFile.Get(tdir_2 + '/' + s + '_' + tdir_2 )

    sig_1 =  round(tmp_1.Integral() / sqrt(sum1), 3)
    sig_2 =  round(tmp_2.Integral() / sqrt(sum2) , 3)
    s_sqrtb.append((s , sig_1, sig_2))
    print  "{}\t\t{}\t\t{} ".format(s, sig_1, sig_2)






def get_integral(idx, sample_name):
    var = 'deltaR'
    tdir_1 = var+'_'+idx
    inFile = ROOT.TFile('f_'+var+'_initial.root', 'r')
    hist = inFile.Get(tdir_1 + '/' + sample_name + '_' + tdir_1 )
    return hist.Integral()
  



indices = {'5': 'preselection' , '7':'higgspt    ' , '8':'mvis     ' , '9':'met     ', '9b': 'dr<2.0    '}
keyList = sorted(keyList)
print "_"*50
print "{},{},{},{},{}".format("cut name", "sample name", "nevents_xs=1pb" , "ngen", "acc*eff %")
for hist in signal_2hdma:
    print "{},{},{},{},{}".format("cut name", "sample name", "nevents_xs=1pb", "ngen", "acc*eff %")
    for idx in sorted(indices):        
        integral = get_integral(idx , hist)   
        ngen = signal_list[hist]
        acc_eff = integral  /  (41520 *0.06)
        print "{},{},{},{},{}".format(indices[idx], hist , round(integral,3), ngen, round(100*acc_eff, 3))
    print ""

print ""
print "_"*50
print "{},{},{},{},{}".format("cut name", "sample name", "nevents_xs=1pb", "ngen", "acc*eff %")
for hist in signal_zprime:
    print "{},{},{},{},{}".format("cut name", "sample name", "nevents_xs=1pb", "ngen", "acc*eff %")
    for idx in sorted(indices):        
        integral = get_integral(idx , hist)   
        ngen = signal_list[hist]
        acc_eff = integral / (41520 * 0.06)
        print "{},{},{},{},{}".format(indices[idx], hist , round(integral,3), ngen, round(100*acc_eff, 3))
    print ""



    

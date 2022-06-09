#!/usr/bin/python
import subprocess
from os import path, listdir, getcwd, kill, popen
import argparse
import signal
import time


current_path = getcwd()

print current_path

var_mapping = { 1: "elePt" ,  2:"eleEta",         3:"elePhi" ,
                4: "muPt" ,   5:"muEta",          6:"muPhi" ,
                7:"tauPt",    8:"tauEta",         9:"tauPhi",
                10:"tau1Pt",  11:"tau1Eta",      12:"tau1Phi",
                13:"tau2Pt",  14:"tau2Eta",      15:"tau2Phi",
                16:"tauIso",  17:"tauDecayMode", 18:"tauCharge", 
                19:"deltaR",  20:"higgsPt",      21:"nJet", 
                22:"visMass", 23:"mT_eleMet",    24:"trigger",  
                25:"genMatch", 26:"met",         27:"metPhi", 
                28:"deltaPhi",  29:"deltaEta",   30:"metLongXaxis",  
                31:"tot_TMass",  32:"tot_TMass_full" ,
                }
def get_idx():
    print "Choose index to select variable(s) to scale/plot ,  example -idx 4   or -idx 4,5,12,11"
    for k, v in sorted(var_mapping.items(), key=lambda x : x[0]):
            print(" ##  {}  : {}".format(v, k))


def main(idx, ch):
    
    bashCommands =  [ 
                    "echo running {} ".format(var_mapping[int(idx)]),
                    "bash remove_existingfiles.sh scaled_files {}".format(var_mapping[int(idx)]),
                    "python postAnalyzer.py -idx {}".format(idx),
                    "bash remove_existingfiles.sh agg_file {}".format(var_mapping[int(idx)]),
                    "hadd f_{i}_initial.root sample/*{i}.root".format(i=var_mapping[int(idx)]),
                    "bash remove_existingfiles.sh agg_file {}".format(ch),
                    "hadd f_{}_initial.root sample/*tot_TMass_full.root".format(ch),
                    "python get_zll.py --hist {}".format(var_mapping[int(idx)]),
                    "python get_small_mc.py --hist {}".format(var_mapping[int(idx)]),
                    "python get_jetFakes.py --hist {}".format(var_mapping[int(idx)]),
                    "python get_jetFakes_unc.py --hist {}".format(var_mapping[int(idx)]),
                    "python get_zll.py --hist {}".format(ch),
                    "python get_small_mc.py --hist {}".format(ch),
                    "python get_jetFakes.py --hist {}".format(ch),
                    "python get_jetFakes_unc.py --hist {}".format(ch),
                    "python gather_hist_v3.py",
                    "python gather_hist_v4.py"
                     ]
    
    command = ' ; '.join(bashCommands)
    print "executing  |  " + command
    start = time.time()
    try:
        process = subprocess.Popen(command , shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        while process.poll() is None:
            print process.stdout.readline()
        process.communicate() 
    except KeyboardInterrupt:
        print "Got Keyboard interrupt"    

    end = time.time()
    print "Total time for executing = {} minutes ".format((end-start)//60)
    print "....Done....."

if __name__=="__main__":

    parser = argparse.ArgumentParser()
    get_idx()
    print " "
    print "Usage : python main.py -idx 2,3,4 -ch etau"
    parser.add_argument("-idx",
                    help="index of hist to be plotted,  example -idx 4   or -idx 4,5,12,11 ")    
                    
    parser.add_argument("-ch",
                    help="channel name, etau, mutau, tautau ")
    
    args =  parser.parse_args()
    if args.idx is None:
        print "No index passed"
        get_idx()
        exit()
    if args.ch is None:
        print "Specify channel name etau, mutau or tautau"
        exit()
    channel = args.ch
    start = time.time()
    for idx in args.idx.split(','):
        main(idx, channel)
    end = time.time()
    print "Total time for executing = {} minutes".format((end-start)//60)
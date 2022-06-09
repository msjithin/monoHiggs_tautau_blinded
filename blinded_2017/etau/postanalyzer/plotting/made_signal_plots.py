import ROOT
from os import path, listdir, getcwd
from sys import path

from myPlotStyle import *
from xsec_mapping import xsec_map

ROOT.gStyle.SetFrameLineWidth(1)
ROOT.gStyle.SetLineWidth(2)
ROOT.gStyle.SetOptStat(0)

def add_text(text="", lowX=0.5, lowY=0.5):
    lumi  = ROOT.TPaveText(lowX, lowY, lowX+0.1, lowY+0.1, "NDC")
    lumi.SetBorderSize(   0 )
    lumi.SetFillStyle(    0 )
    lumi.SetTextAlign(   12 )
    lumi.SetTextColor(    1 )
    lumi.SetTextSize(0.04)
    lumi.SetTextFont (   42 )
    lumi.AddText(text)
    return lumi

def GetKeyNames( self, dir = "" ):
    self.cd(dir)
    return [key.GetName() for key in ROOT.gDirectory.GetListOfKeys()]
ROOT.TFile.GetKeyNames = GetKeyNames

inFile = ROOT.TFile('f_etau_initial.root', 'r')
idx = '9'
tdir_1 = 'tot_TMass_full_'+idx
indices = {'5': 'preselection' , '7':'higgspt>65' , '8':'mvis<125' , '9':'met>105', '9b': 'dr<2.0'}
keyList = inFile.GetKeyNames(tdir_1)

signal_2hdma = []
for hist in keyList:
    if '2HDMa_gg_sinp_0p35_tanb_1p0_mXd_10' in hist:
        hist = hist.replace('_'+tdir_1, '')
        ma = int(hist.split('_')[-1])
        if ma != 100 : continue
        signal_2hdma.append(hist)

signal_zprime = []
for hist in keyList:
    if 'MZp_' in hist:
        hist = hist.replace('_'+tdir_1, '')
        mchi = int(hist.split('_')[-1])
        if mchi != 1: continue
        signal_zprime.append(hist)   


print signal_2hdma
print signal_zprime
colors = [ROOT.kRed, ROOT.kPink+4, ROOT.kMagenta, 
            ROOT.kViolet+10,  ROOT.kAzure+10, ROOT.kGreen,
            ROOT.kOrange, ROOT.kTeal, ROOT.kBlack, ROOT.kBlue-10]

def make_plot(cat='', xsec_scaling=False):
    c, pad1, pad2 = get_canvas()
    legende=make_legend()
    c.cd()
    pad1.Draw()
    pad1.cd()
    pad1.SetBottomMargin(0.1)

    y_max = 0
    signal_list = []
    if cat=='zprime':
        signal_list = signal_zprime
    elif cat=='2hdma':
        signal_list = signal_2hdma


    signal_map = []
    for s in signal_list:
        tmp = inFile.Get(tdir_1 + '/' + s + '_' + tdir_1 )
        if xsec_scaling:
            tmp.Scale(xsec_map[s])
        #print s , tmp.GetMaximum()
        y_max = max(y_max ,tmp.GetMaximum() )
        signal_map.append([s, tmp.GetMaximum()])

    signal_map = sorted(signal_map, key=lambda x: x[1], reverse=True)
    signal_list = [x[0] for x in signal_map]
    tmp = inFile.Get(tdir_1 + '/' + signal_list[0] + '_' + tdir_1 )
    if xsec_scaling:
        tmp.Scale(xsec_map[signal_list[0]])
    tmp.SetLineColor(colors[0])
    legende.AddEntry( tmp , signal_list[0] , "f")

    tmp.SetMaximum(1.2* y_max)
    tmp.SetLineWidth(4)
    tmp.GetXaxis().SetTitle('tot tr mass [Gev]')
    tmp.GetYaxis().SetTitle('Events')
    tmp.SetTitle('tot tr mass')
    tmp.Draw('hist')

    label_text1 = add_text('2HDMa', 0.5, 0.55)
    label_text1.Draw('SAME')
    label_text2 = add_text(indices[idx], 0.5, 0.45)
    label_text2.Draw('SAME')    
    if not xsec_scaling:
        label_text3 = add_text('xs = 1pb', 0.5, 0.35)
        label_text3.Draw('SAME')

    i = 1
    for s in signal_list[1:]:
        tmp = inFile.Get(tdir_1 + '/' + s + '_' + tdir_1 )
        tmp.SetLineColor(colors[i])
        if xsec_scaling:
            tmp.Scale(xsec_map[s])
        tmp.SetLineWidth(4)
        tmp.Draw('histsame')
        legende.AddEntry( tmp , s , "f")
        i += 1

    l1=add_lumi('2017', 'etau', blindingRatio = 1)
    l1.Draw("same")

    c.cd()
    pad2.Draw()
    pad2.cd()
    legende.Draw('same')

    pad1.RedrawAxis()
    c.Modified()

    if xsec_scaling:
        c.SaveAs('plots_signal/plot_'+cat+'_.png')
    else:
        c.SaveAs('plots_signal/plot_'+cat+'_xsec1pb_.png')
    c.Close()



make_plot('2hdma')
make_plot('zprime')

make_plot('2hdma', True)
make_plot('zprime', True)
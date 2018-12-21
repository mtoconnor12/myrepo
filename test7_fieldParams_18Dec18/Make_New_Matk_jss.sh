#!/usr/bin/env bash

fname="AllColumns_$(date +"%Y_%m%d_%H%M").txt"
oldSuffix="_18Dec18"
newSuffix1="_18Dec18_CrashedRuns"
newSuffix2="_18Dec18_UncrashedRuns"
matkSuffix="_matk.py"
jssSuffix="_jss.sh"
touch $fname

echo "Filename: $fname"

for runName in TussockTundraHi TussockTundraLo WaterTrack WoodyShrubsHillslope SedgeHi WoodyShrubsRiparianHi SedgeLo FrostBoils
do
	#sed -i "s/$runName$matkSuffix/$runName$oldSuffix$matkSuffix/g" $runName$oldSuffix$jssSuffix
	cp $runName$oldSuffix$matkSuffix $runName$newSuffix1$matkSuffix
	cp $runName$oldSuffix$matkSuffix $runName$newSuffix2$matkSuffix
	cp $runName$oldSuffix$jssSuffix $runName$newSuffix1$jssSuffix
	cp $runName$oldSuffix$jssSuffix $runName$newSuffix2$jssSuffix
	sed -i '56,66d;68,81d' $runName$newSuffix1$matkSuffix
	#sed -i '68,81d' $runName$newSuffix1$matkSuffix
	sed -i '56,66d;68,81d' $runName$newSuffix2$matkSuffix
        #sed '68,81d' $runName$newSuffix2$matkSuffix
	sed -i "s/'_template' + suffix/'_template' + '$newSuffix1'/g" $runName$newSuffix1$matkSuffix
	sed -i "s/'_template' + suffix/'_template' + '$newSuffix2'/g" $runName$newSuffix2$matkSuffix
	sed -i "s/$runName$oldSuffix$matkSuffix/$runName$newSuffix1$matkSuffix/g" $runName$newSuffix1$jssSuffix
	sed -i "s/workdir_base=runName + suffix/workdir_base=runName + '$newSuffix1'/g" $runName$newSuffix1$matkSuffix
	sed -i "s/$runName$oldSuffix$matkSuffix/$runName$newSuffix2$matkSuffix/g" $runName$newSuffix2$jssSuffix
	sed -i "s/workdir_base=runName + suffix/workdir_base=runName + '$newSuffix2'/g" $runName$newSuffix2$matkSuffix
	if [ "$runName" = "TussockTundraHi" ];
	then
		sed -i "s/njobs = 32/njobs = 15"
		sed -i "57i [[0.09,0.06,9.35e-11,2.29e-13,1.14e-12,2],[0.09,0.06,9.35e-11,3.18e-12,1.9e-13,3],[0.09,0.06,9.35e-11,3.18e-12,1.14e-12,4],[0.09,0.06,2.54e-10,2.29e-13,1.9e-13,5],[0.09,0.06,2.54e-10,2.29e-13,1.14e-12,6],[0.09,0.06,2.54e-10,3.18e-12,1.14e-12,8],[0.09,0.14,9.35e-11,2.29e-13,1.14e-12,10],[0.09,0.14,9.35e-11,3.18e-12,1.9e-13,11],[0.09,0.14,2.54e-10,2.29e-13,1.9e-13,13],[0.09,0.14,2.54e-10,3.18e-12,1.14e-12,16],[0.17,0.06,9.35e-11,2.29e-13,1.9e-13,17],[0.17,0.06,2.54e-10,2.29e-13,1.14e-12,22],[0.17,0.14,9.35e-11,2.29e-13,1.9e-13,25],[0.17,0.14,9.35e-11,2.29e-13,1.14e-12,26],[0.17,0.14,2.54e-10,3.18e-12,1.14e-12,32]]" $runName$newSuffix1$matkSuffix
		sed -i "s/njobs = 32/njobs = 15"
                sed -i "57i 
	elif [ "$runName" = "TussockTundraLo" ];
        then
		sed -i "s/njobs = 32/njobs = 8"
                sed -i "57i [[0.07,0.06,4.42e-11,1.4e-11,6.56e-15,3],[0.07,0.06,4.42e-11,1.4e-11,2.66e-14,4],[0.07,0.06,1.65e-10,2.75e-12,6.56e-15,5],[0.07,0.16,1.65e-10,2.75e-12,2.66e-14,14],[0.07,0.16,1.65e-10,1.4e-11,6.56e-15,15],[0.12,0.06,4.42e-11,2.75e-12,6.56e-15,17],[0.12,0.06,1.65e-10,1.4e-11,2.66e-14,24],[0.12,0.16,4.42e-11,2.75e-12,6.56e-15,25]]" $runName$newSuffix1$matkSuffix
                sed -i "s/njobs = 32/njobs = 15"
                sed -i "57i
	elif [ "$runName" = "WaterTrack" ]; 
        then
                sed -i "s/njobs = 32/njobs = 11"
                sed -i "57i [[0.05,0.14,5.79e-11,1.22e-12,3.88e-13,2],[0.05,0.14,5.79e-11,3.59e-12,1.16e-14,3],[0.05,0.14,5.79e-11,3.59e-12,3.88e-13,4],[0.05,0.14,2.93e-10,3.59e-12,3.88e-13,8],[0.05,0.26,2.93e-10,1.22e-12,1.16e-14,13],[0.05,0.26,2.93e-10,1.22e-12,3.88e-13,14],[0.05,0.26,2.93e-10,3.59e-12,1.16e-14,15],[0.1,0.14,2.93e-10,1.22e-12,3.88e-13,22],[0.1,0.26,5.79e-11,1.22e-12,1.16e-14,25],[0.1,0.26,2.93e-10,1.22e-12,1.16e-14,29],[0.1,0.26,2.93e-10,3.59e-12,3.88e-13,32]]" $runName$newSuffix1$matkSuffix
                sed -i "s/njobs = 32/njobs = 15"
                sed -i "57i
	elif [ "$runName" = "WoodyShrubsHillslope" ];
        then
                sed -i "s/njobs = 32/njobs = 11"
                sed -i "57i [[0.1,0.02,1.57e-10,1.7e-12,1.05e-15,5],[0.1,0.02,1.57e-10,1.7e-12,7.11e-14,6],[0.1,0.02,1.57e-10,6.03e-12,1.05e-15,7],[0.1,0.12,1.57e-10,1.7e-12,1.05e-15,13],[0.1,0.12,1.57e-10,6.03e-12,7.11e-14,16],[0.2,0.02,1.05e-11,1.7e-12,1.05e-15,17],[0.2,0.02,1.57e-10,1.7e-12,1.05e-15,21],[0.2,0.02,1.57e-10,1.7e-12,7.11e-14,22],[0.2,0.02,1.57e-10,6.03e-12,1.05e-15,23],[0.2,0.12,1.05e-11,1.7e-12,1.05e-15,25],[0.2,0.12,1.57e-10,6.03e-12,1.05e-15,31]]" $runName$newSuffix1$matkSuffix
                sed -i "s/njobs = 32/njobs = 15"
                sed -i "57i
	elif [ "$runName" = "SedgeHi" ];
        then
                sed -i "s/njobs = 32/njobs = 6"
                sed -i "57i [[0.1,0.2,1.57e-10,4.68e-13,1.05e-15,5],[0.1,0.2,1.57e-10,4.68e-13,7.97e-14,6],[0.1,0.2,1.57e-10,1.43e-12,1.05e-15,7],[0.1,0.2,1.57e-10,1.43e-12,7.97e-14,8],[0.17,0.2,1.05e-11,1.43e-12,7.97e-14,20],[0.17,0.2,1.57e-10,1.43e-12,1.05e-15,23]]" $runName$newSuffix1$matkSuffix
                sed -i "s/njobs = 32/njobs = 15"
                sed -i "57i
	elif [ "$runName" = "WoodyShrubsRiparianHi" ];
        then
                sed -i "s/njobs = 32/njobs = 12"
                sed -i "57i [[0.08,0.1,1.05e-11,6.03e-12,7.11e-14,4],[0.08,0.1,1.57e-10,1.7e-12,1.05e-15,5],[0.08,0.1,1.57e-10,1.7e-12,7.11e-14,6],[0.08,0.1,1.57e-10,6.03e-12,1.05e-15,7],[0.08,0.1,1.57e-10,6.03e-12,7.11e-14,8],[0.08,0.2,1.57e-10,1.7e-12,1.05e-15,13],[0.16,0.1,1.05e-11,6.03e-12,7.11e-14,20],[0.16,0.1,1.57e-10,1.7e-12,1.05e-15,21],[0.16,0.1,1.57e-10,1.7e-12,7.11e-14,22],[0.16,0.1,1.57e-10,6.03e-12,1.05e-15,23],[0.16,0.1,1.57e-10,6.03e-12,7.11e-14,24],[0.16,0.2,1.57e-10,1.7e-12,7.11e-14,30]]" $runName$newSuffix1$matkSuffix
                sed -i "s/njobs = 32/njobs = 15"
                sed -i "57i
	elif [ "$runName" = "SedgeLo" ];
        then
                sed -i "s/njobs = 32/njobs = 9"
                sed -i "57i [[0.03,0.18,1.05e-11,7.78e-13,1.05e-15,1],[0.03,0.18,1.57e-10,7.78e-13,1.05e-15,5],[0.03,0.18,1.57e-10,3.94e-12,1.05e-15,7],[0.03,0.18,1.57e-10,3.94e-12,7.97e-14,8],[0.03,0.46,1.57e-10,7.78e-13,1.05e-15,13],[0.03,0.46,1.57e-10,3.94e-12,1.05e-15,15],[0.12,0.18,1.57e-10,7.78e-13,1.05e-15,21],[0.12,0.18,1.57e-10,7.78e-13,7.97e-14,22],[0.12,0.18,1.57e-10,3.94e-12,7.97e-14,24]]" $runName$newSuffix1$matkSuffix
                sed -i "s/njobs = 32/njobs = 15"
                sed -i "57i
	elif [ "$runName" = "FrostBoils" ];
	then
                sed -i "s/njobs = 32/njobs = 7"
		sed -i "57i [[0.01,0.04,1.05e-11,4.54e-14,2.1e-15,11],[0.01,0.04,1.57e-10,4.54e-14,2.1e-15,14],[0.02,0.02,1.57e-10,4.54e-14,2.1e-15,24],[0.02,0.04,1.57e-10,4.54e-14,2.1e-15,29],[0.02,0.04,1.57e-10,4.54e-14,2.1e-15,30],[0.02,0.04,1.57e-10,4.54e-14,2.1e-15,31],[0.02,0.04,1.57e-10,4.54e-14,2.1e-15,32] " $runName$newSuffix1$matkSuffix
                sed -i "s/njobs = 32/njobs = 15"
                sed -i "57i
        fi;
done

#
#   THIS CODE IS UNDER THE BSD 2-Clause LICENSE. YOU CAN FIND THE COMPLETE 
#					FILE AT THE SOURCE DIRECTORY.
#				
#       Copyright (C) 2017 V.-M. Katsageorgiou - All rights reserved
#	
#           	@author : vasiliki.katsageorgiou@gmail.com
#
#	
#						Publication:
#	A Novel Unsupervised Analysis of Electrophysiological
#		Signals Reveals New Sleep Sub-stages in Mice
#		
#		
#*****************************************************************************


#!/bin/bash

#BSUB -q "gpua100 gpuv100"
module load cuda
module load binutils
module load gcc
module load matplotlib

#BSUB -J train_model
#BSUB -R "rusage[mem=5GB]"
#BSUB -W 24:00
#BSUB -n 5
#BSUB -R "span[hosts=1]"
#BSUB -R "select[gpu32gb]"
#BSUB -gpu "num=1:mode=exclusive_process"
#BSUB -o Output_%J.txt
#BSUB -e Error_%J.txt


# this script is call the trainModel.py script that is responsible for the
# training of the mcRBM

# Set path to the directory where the analysis will be stored:
# NOTE that the configuration files that can be found in the
# "configurationFiles" folder need to have been stored in the same directory.
#BASE_DIR="/home/vkatsageorgiou/mouseSleepAnalysis/experiment1/"
BASE_DIR="/zhome/dd/4/109414/mouseSleepAnalysis-master/trainModel/"
if [ ! -f "${BASE_DIR}done" ] 
	then
		echo "starting ${BASE_DIR}"
		
		# set the id of the GPU to be used for the computations
		python2 trainModel.py -f "${BASE_DIR}" -gpuId 0
		
		#echo "letting gpu 0 cool down" #-- Uncomment in case you want to run multiple experiments
		#sleep 1800  #-- Uncomment in case you want to run multiple experiments
fi

#!/usr/bin/env Rscript

setwd("/home/hchoi71/R/distmats_for_pd_from_phase_space_downsampled/")

slurm_arrayid <- Sys.getenv('SLURM_ARRAY_TASK_ID')
nn=as.numeric(slurm_arrayid)
library(package='TDA')
library(R.matlab)
require('gtools')

## start of function

hpc_get_pds_mocap_from_phasespace_downsampled<- function(nn)
  
  
library(package='TDA')
library(R.matlab)
require('gtools')
filenames_mat<- list.files(,'.mat')
filenames_mat<- mixedsort(filenames_mat) ## cn access individual element as f[1] f[2] etc
aj<- readMat('/home/hchoi71/R/actions_joints.mat')
foo<- as.matrix(aj$actions.joints);## list of all 158*57 . Can access individual by 


index_start= (nn-1)*10+1; index_end= (nn)*10 ## 10 joints at once. Run the code with nn changing fromm 1 to 900.
for (i in index_start:index_end)
{
action=foo[i,1]
joint=foo[i,2]

#filenames_mat <- as.list(Sys.glob("*.mat")) 
print("the working directory is :")

getwd()
print(filenames_mat[action])

distmat_alljoints<- readMat(filenames_mat[action]);## nn should vary from 1-158


  one_joint= distmat_alljoints$dist;
  each_joint=one_joint[joint]
  
  Diag<- ripsDiag(each_joint[[1]][[1]], 1,5,
                  library = "Dionysus",location = FALSE, printProgress = TRUE,dist = "arbitrary");
  

  pd=Diag[["diagram"]]
  
  writeMat(paste("/home/hchoi71/R/persistence_diagrams_from_phase_space_downsampled/",filenames_mat[action],'/',"joint-",joint,'.mat', sep=""),pd=pd)
  
  
  
}
  




hpc_get_pds_mocap_from_phasespace_downsampled(nn)

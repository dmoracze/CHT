# source the function
source('~/iCloud/code/CHT/item_analysis/trial_data.R')

top.dir <- '/volumes/research$/redcay/DSCN Lab/Experiments/CAT/CHT_Scan/CHT_Data/completed'

# group1
subj <- as.factor(c('RED_CAT_157'))
runs <- c(1,2,3,4)
g1.1234 <- trial_data(top.dir,subj,runs)

subj <- as.factor(c('RED_CAT_152'))
runs <- c(1,3,4)
g1.134 <- trial_data(top.dir,subj,runs)

fin.g1 <- rbind(g1.1234,g1.134)
write.csv(fin.g1,'~/iCloud/code/CHT/item_analysis/group1.Rdat.csv',quote=FALSE,row.names=FALSE)

# group2
subj <- as.factor(c('RED_CAT_234'))
runs <- c(1,2,3,4)
g2.1234 <- trial_data(top.dir,subj,runs)

fin.g2 <- g2.1234
write.csv(fin.g2,'~/iCloud/code/CHT/item_analysis/group2.Rdat.csv',quote=FALSE,row.names=FALSE)


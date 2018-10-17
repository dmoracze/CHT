source('~/iCloud/code/CHT/item_analysis/trial_data.R')

subj <- as.factor(c('CHT_RED_CAT_152','CHT_RED_CAT_154','CHT_RED_CAT_157','CHT_RED_CAT_160','CHT_RED_CAT_161','CHT_RED_CAT_163','CHT_RED_CAT_234','CHT_RED_CAT_242'))
top.dir <- '/volumes/research$/redcay/DSCN Lab/Experiments/CAT/CHT_Scan/CHT_Data/completed'
runs <- c(1,2,3,4)

test <- trial_data(top.dir,subj,runs)



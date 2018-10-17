library(reshape2)
library(tidyr)
library(dplyr)
# Item analysis for the Psychopy participants
top.dir <- '/volumes/research$/redcay/DSCN Lab/Experiments/CAT/CHT_Scan/CHT_Data/completed'
#top.dir <- '~/Desktop/completed'


subj <- as.factor(c('CHT_RED_CAT_152','CHT_RED_CAT_154','CHT_RED_CAT_157','CHT_RED_CAT_160','CHT_RED_CAT_161','CHT_RED_CAT_163','CHT_RED_CAT_234','CHT_RED_CAT_242'))

runs <- as.factor(sprintf('Run%i',seq(1,4,1)))

qdat <- list()
sdat <- list()

for (ss in levels(subj)) {
	setwd(paste0(top.dir,'/',ss))
	count <- 0
	for (rr in levels(runs)) {
		count <- count+1
		sdat[[count]] <- read.csv(paste0(ss,'_',rr,'.csv'),stringsAsFactors=FALSE)
	}
	qdat[[ss]] <- sdat
}


question <- vector()
response <- vector()
feedback <- vector()
subject <- vector()

for (ss in levels(subj)) {
	count <- 0
	for (rr in levels(runs)) {
		count <- count+1
		question <- rbind(question,qdat[[ss]][[count]]$Question)
		response <- rbind(response,qdat[[ss]][[count]]$ParticipantsAnswer)
		feedback <- rbind(feedback,qdat[[ss]][[count]]$Feedback)
		subject <- rbind(subject,qdat[[ss]][[count]]$ParticipantID)
	}
}
qr <- data.frame(question=melt(question)$value,response=melt(response)$value,feedback=melt(feedback)$value,subj=melt(subject)$value)

dis <- filter(qr,feedback==3) %>%
	arrange(question)
dis <- droplevels(dis$question)


nodis.qr <- qr %>% filter(!question %in% levels(dis)) %>% arrange(question)

nodis.qr$question <- droplevels(nodis.qr$question)

behq <- unique(nodis.qr$question)



master <- read.csv('/volumes/research$/redcay/DSCN Lab/Experiments/CAT/CHT_Scan/exp_stimuli.csv',stringsAsFactors=FALSE)
master.nodis <- filter(master,Condition!=3 & Condition!=6)
length(masq <- unique(master.nodis$ItemText))


test <- subset(master, master$Condition!=3 & master$Condition!=6)
length(unique(test$ItemText))

test <- as.factor(c('one','two','three','four'))



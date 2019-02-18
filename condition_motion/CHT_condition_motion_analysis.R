########################### LIBRARIES ###########################
library(ggplot2)
library(reshape2)
library(lme4)

########################### FUNCTIONS ###########################
# this function will read in timing and motion files from afni_cond_motion_analysis and create a condition-specific data frame for statistical analysis
CHT_motion <- function(dir,subj,grp,part,event) {
	n <- length(subj)*length(part)*length(event) # number of rows
	s <- vector('character',n) # subjects
	p <- vector('character',n) # partner
	e <- vector('character',n) # event
	g <- vector('character',n) # group (probably should just be 1)
	m <- vector('numeric',n) # motion
	count <- 0
	# loop through the subjects
	for (ss in 1:length(subj)) {
		cat(subj[ss],'\n')
		# read in subject's motion
		mot <- read.table(paste0(dir,'/mopar/',subj[ss],'_CHTall.enorm.1D'))
		# loop through the chat partners
		for (pp in 1:length(part)) {
			# loop through the event types
			for (ee in 1:length(event)) {
				count <- count+1
				# read in stim file
				tim <- read.table(paste0(dir,'/times/',subj[ss],'.',part[pp],'.',event[ee],'.1D'))
				nT <- length(which(tim==1)) # count number of TRs
				inter <- mot*tim # multiply sitm file by motion
				s[count] <- subj[ss] # record subject
				p[count] <- part[pp] # record partner
				e[count] <- event[ee] # record event
				g[count] <- grp # record group
				m[count] <- sum(inter)/nT # sum of FD / number of TRs
			}
		}
	}
	# put it all together
	fin <- data.frame(subj=s,partner=p,event=e,group=g,meanFD=m)
	return(fin)
}


########################### ANALYSIS ###########################
dir <- '/export/data/brain1/CHT/Dustin/gPPI/dissertation/condition_motion'
part <- c('peer','comp')
event <- c('init','agree','away')


nt <- c('RED_CAT_104', 'RED_CAT_107', 'RED_CAT_109', 'RED_CAT_110', 'RED_CAT_111', 'RED_CAT_115', 'RED_CAT_116', 'RED_CAT_117', 'RED_CAT_118', 'RED_CAT_123', 'RED_CAT_124', 'RED_CAT_127', 'RED_CAT_128', 'RED_CAT_132', 'RED_CAT_133', 'RED_CAT_134', 'RED_CAT_135', 'RED_CAT_139', 'RED_CAT_140', 'RED_CAT_142', 'RED_CAT_144', 'RED_CAT_145', 'RED_CAT_147', 'RED_CAT_148', 'RED_CAT_149', 'RED_CAT_150', 'RED_CAT_155', 'RED_CAT_157', 'RED_CAT_160', 'RED_CAT_164', 'RED_CAT_168', 'RED_CAT_170', 'RED_CAT_173', 'RED_CAT_174', 'RED_CHT_ASD_168', 'RED_CHT_ASD_169', 'RED_CHT_ASD_170', 'RED_CHT_ASD_171', 'RED_CHT_ASD_177', 'RED_LL_167', 'RED_LL_187', 'RED_RL_106', 'RED_RL_111', 'RED_RL_118', 'RED_RL_119', 'RED_RL_124', 'RED_RL_126', 'RED_RL_128', 'RED_RL_130', 'RED_RL_146', 'RED_RL_150', 'RED_RL_151', 'RED_RL_152', 'RED_RL_153', 'RED_RL_154', 'RED_RL_155', 'RED_RL_157', 'RED_RL_158', 'RED_RL_159', 'RED_RL_160', 'RED_RL_162', 'RED_RL_163', 'RED_RL_165')
asd <- c('RED_CHT_ASD_224', 'RED_CAT_228', 'RED_CAT_224', 'RED_CAT_241', 'RED_CHT_ASD_212', 'RED_CAT_229', 'RED_CHT_ASD_215', 'RED_CHT_ASD_225', 'RED_CAT_205', 'RED_CAT_248', 'RED_CHT_ASD_211', 'RED_CAT_220', 'RED_CHT_ASD_220', 'RED_CAT_216', 'RED_CHT_ASD_201', 'RED_CAT_234', 'RED_CAT_218', 'RED_CAT_212', 'RED_CHT_ASD_223', 'RED_CHT_ASD_202', 'RED_CHT_ASD_227', 'RED_CHT_ASD_209', 'RED_CHT_ASD_216', 'RED_CAT_230', 'RED_CAT_226', 'RED_CHT_ASD_218', 'RED_CHT_ASD_213', 'RED_CAT_217', 'RED_CAT_242', 'RED_CAT_201', 'RED_CAT_207')


n <- CHT_motion(dir,nt,'NT',part,event)
a <- CHT_motion(dir,asd,'ASD',part,event)

dat <- rbind(n,a)

write.csv(dat,paste0(dir,'/condition_motion_summary.csv'),quote=FALSE,row.names=FALSE)





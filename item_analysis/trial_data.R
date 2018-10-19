trial_data <- function(dir,subj,runs) {
	# take a list of subjects and runs from the CHT experiment and compile some relevant behavioral data

	lapply(c('reshape2','dplyr'),require,character.only=TRUE)
	question <- vector()
	response <- vector()
	feedback <- vector()
	subject <- vector()
	for (ss in levels(subj)) {
	count <- 0
		for (rr in 1:length(runs)) {
			count <- count+1
			run <- paste0('Run',rr)
			qdat <- read.csv(paste0(dir,'/CHT_',ss,'/CHT_',ss,'_',run,'.csv'),stringsAsFactors=FALSE)
			subject <- rbind(subject,qdat$ParticipantID) # subject ID
			question <- rbind(question,qdat$Question) # question
			response <- rbind(response,qdat$ParticipantsAnswer) # response
			feedback <- rbind(feedback,qdat$Feedback) # outcome
			
		}
		fin <- data.frame(subj=melt(subject)$value,question=melt(question)$value,response=melt(response)$value,feedback=melt(feedback)$value)
	}
	return(fin)
}

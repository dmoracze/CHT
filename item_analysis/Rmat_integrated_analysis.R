library(tidyr)
library(dplyr)
setwd('~/iCloud/code/CHT/item_analysis/')

##### All Participants #####

# names for the columns in the mat files
nam <- c('subj','question','response','feedback')

# matlab group 1
mat1 <- read.csv('group1.matdat.csv')
names(mat1) <- nam
# R group 1
r1 <- read.csv('group1.Rdat.csv')
# combine group1
group1 <- rbind(mat1,r1)
group1$group <- 'group1'

# matlab group 2
mat2 <- read.csv('group2.matdat.csv') 
names(mat2) <- nam
# R group 2
r2 <- read.csv('group2.Rdat.csv')
# combine group 2
group2 <- rbind(mat2,r2)
group2$group <- 'group2'

# combine both groups
all <- rbind(group1,group2)

# disagree questions (do not use feedback in case the participant skips)
dis <- c('I can whistle.', 'I collect rocks.', 'I have a cat.', 'I have been to California.', 'I ice skate.', 'I like Harry Potter.', 'I like Starbucks.', 'I sing.')

# filter to remove disagree questions
all.nd <- all %>% filter(!question %in% dis) %>% arrange(question)
# drop unused levels
all.nd$question <- droplevels(all.nd$question)

# convert response to common skip label and revalue
all.nd$response[all.nd$response=='-1'] <- 'N/A'
all.nd$response <- as.factor(all.nd$response)
all.nd$response <- recode(all.nd$response, '0'='no','1'='yes','N/A'='skip')

# organize the data to get percentage
new <- all.nd %>%
group_by(question,group,response) %>%
summarise(perc=n()) %>%
mutate(perc=round(prop.table(perc)*100,2)) %>%
spread(key=group,value=perc) %>%
mutate('g1-g2'=group1-group2)

# write data to csv
write.csv(new,'final_analysis.csv',row.names=FALSE,quote=FALSE)

##### Matched Participants #####

# names for the columns in the mat files
nam <- c('subj','question','response','feedback')

# matlab group 1
mat1 <- read.csv('group1.matched.matdat.csv')
names(mat1) <- nam
group1 <- mat1
group1$group <- 'group1'

# matlab group 2
mat2 <- read.csv('group2.matdat.csv') 
names(mat2) <- nam
# R group 2
r2 <- read.csv('group2.Rdat.csv')
# combine group 2
group2 <- rbind(mat2,r2)
group2$group <- 'group2'

# combine both groups
all <- rbind(group1,group2)

# disagree questions (do not use feedback in case the participant skips)
dis <- c('I can whistle.', 'I collect rocks.', 'I have a cat.', 'I have been to California.', 'I ice skate.', 'I like Harry Potter.', 'I like Starbucks.', 'I sing.')

# filter to remove disagree questions
all.nd <- all %>% filter(!question %in% dis) %>% arrange(question)
# drop unused levels
all.nd$question <- droplevels(all.nd$question)

# convert response to common skip label and revalue
all.nd$response[all.nd$response=='-1'] <- 'N/A'
all.nd$response <- as.factor(all.nd$response)
all.nd$response <- recode(all.nd$response, '0'='no','1'='yes','N/A'='skip')

# organize the data to get percentage
new <- all.nd %>%
group_by(question,group,response) %>%
summarise(perc=n()) %>%
mutate(perc=round(prop.table(perc)*100,2)) %>%
spread(key=group,value=perc) %>%
mutate('g1-g2'=group1-group2)

# write data to csv
write.csv(new,'final_analysis.matched.csv',row.names=FALSE,quote=FALSE)



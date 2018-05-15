
library(tidyverse)

data1 <- read.csv2("../Sourcedata/graded_assignment_2.csv")
head(data1)


data2 <- data1 %>% 
    mutate(Health_status, if(FKG+DKG=0, Health_status=1),
           ifelse(Health_status=0))
  
head(data2)

data2 <- data2 %>%
  mutate(Health_status = as.numeric(Health_status))
str(data2)

data3 <- data2 %>%
  group_by(Gender, Health_status) %>%
 summarise(Count_observations = n()) %>%
  mutate(Health_status=as.factor(Health_status))

data3

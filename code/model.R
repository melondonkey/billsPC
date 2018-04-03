require(lme4)
require(arm)
require(ggplot2)
df <- read_csv("./data/modeldata.csv")

#Simple model with random intercecpts for each mon
mod1<- lmer(Win ~ (1|mon),
            data=df,
            family="binomial"
            )


summary(mod1)

##Process model data, extracting standard errors as well
effects <- data.frame(ranef(mod1)$mon)
std_errors <- data.frame(se.ranef(mod1)$mon)
effects$mon <- rownames(effects)
colnames(effects)[1] <- "estimate"
std_errors$mon <- rownames(std_errors)
colnames(std_errors)[1] <- "se"

parameters <- effects %>% left_join(std_errors, by="mon") %>% 
  mutate(lower_1se = estimate - se,
         upper_1se = estimate + se
         )

#Very rough effect plot
ggplot(parameters, aes(x=mon, y=estimate)) + geom_text(aes(label=mon), check_overlap = TRUE) +
  geom_hline(yintercept = 0, color="red") + ylab("Effect Estimate") +
  geom_linerange(aes(x=mon, ymin=lower_1se, ymax=upper_1se), alpha=.2, color="blue") +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())
ggsave('./outputs/effectplot.png') 
  


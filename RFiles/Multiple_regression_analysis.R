library(ggplot2)
library(ggfortify)
data(state)
data <- state.x77
sdata <- as.data.frame(data)
mod1 <- lm(Murder ~ 1, data = sdata)
step(mod1, direction = "both", scope = list(upper=~Population + Income + Illiteracy +  `Life Exp`+ `HS Grad` + Frost + Area))
summary(lm(formula = Murder ~ `Life Exp` + Frost + Population + Area + 
             Illiteracy, data = sdata))
pca <- prcomp(sdata, scale = TRUE)
summary(pca)
autoplot(pca, shape = FALSE, label = TRUE, loadings = TRUE,
         loadings.label = TRUE, label.size = 3, scale = 0,
         loadings.label.size = 6)


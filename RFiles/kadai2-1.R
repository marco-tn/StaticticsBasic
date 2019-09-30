data <- read.csv(file = "ippan_2009zensho_z_dataset.csv",header = TRUE,fileEncoding="CP932", stringsAsFactors=F)
data <- transform(data, engel = data$Food/data$L_Expenditure)

data <- transform(data, rhousing = data$Housing/data$L_Expenditure)
data <- transform(data, rlfw = data$LFW/data$L_Expenditure)
data <- transform(data, rfurniture = data$Furniture/data$L_Expenditure)
data <- transform(data, rclothes = data$Clothes/data$L_Expenditure)
data <- transform(data, rhealth = data$Health/data$L_Expenditure)
data <- transform(data, rtransport = data$Transport/data$L_Expenditure)
data <- transform(data, reducation = data$Education/data$L_Expenditure)
data <- transform(data, rrecreation = data$Recreation/data$L_Expenditure)
data <- transform(data, rol = data$OL_Expenditure/data$L_Expenditure)

# 持ち家 ave

(avefood1 <- mean(data[data$T_JuSyoyu == 1,]$engel))
(avehousing1 <- mean(data[data$T_JuSyoyu == 1,]$rhousing))
(avelfw1 <- mean(data[data$T_JuSyoyu == 1,]$rlfw))
(avefurniture1 <- mean(data[data$T_JuSyoyu == 1,]$rfurniture))
(aveclothes1 <- mean(data[data$T_JuSyoyu == 1,]$rclothes))
(avehealth1 <- mean(data[data$T_JuSyoyu == 1,]$rhealth))
(avetransport1 <- mean(data[data$T_JuSyoyu == 1,]$rtransport))
(aveeducation1 <- mean(data[data$T_JuSyoyu == 1,]$reducation))
(averecreation1 <- mean(data[data$T_JuSyoyu == 1,]$rrecreation))
(aveol1 <- mean(data[data$T_JuSyoyu == 1,]$rol))

# 貸し家 ave
(avefood2 <- mean(data[data$T_JuSyoyu == 2,]$engel))
(avehousing2 <- mean(data[data$T_JuSyoyu == 2,]$rhousing))
(avelfw2 <- mean(data[data$T_JuSyoyu == 2,]$rlfw))
(avefurniture2 <- mean(data[data$T_JuSyoyu == 2,]$rfurniture))
(aveclothes2 <- mean(data[data$T_JuSyoyu == 2,]$rclothes))
(avehealth2 <- mean(data[data$T_JuSyoyu == 2,]$rhealth))
(avetransport2 <- mean(data[data$T_JuSyoyu == 2,]$rtransport))
(aveeducation2 <- mean(data[data$T_JuSyoyu == 2,]$reducation))
(averecreation2 <- mean(data[data$T_JuSyoyu == 2,]$rrecreation))
(aveol2 <- mean(data[data$T_JuSyoyu == 2,]$rol))

# 重回帰分析
(out <- lm(data$engel ~ data$rhousing + data$rtransport + data$T_JuSyoyu + data$T_Age_65))
nnTrain <- read.csv("F:/hell/silu/shanxi/annet/nnTrain.csv", header = TRUE, sep = ",", quote = "\"")
plot(nnTrain$CO)
plot(nnTrain$PM10)
sum(is.na(nnTrain$CO))
sum(is.na(nnTrain$PM10))
nnNaInter <- read.csv("F:/hell/silu/shanxi/annet/nnNaInter.csv", header = TRUE, sep = ",", quote = "\"")
sum(is.na(nnNaInter$CO))
sum(is.na(nnNaInter$PM10))
plot(nnNaInter$CO)
plot(nnNaInter$PM10)
nnScale <- read.csv("F:/hell/silu/shanxi/annet/nnScale.csv", header = TRUE, sep = ",", quote = "\"")
plot(nnScale$CO)
plot(nnScale$PM10)

temp <- boxplot.stats(nnTrain$PM10, coef = 20)$out;
temp1 <- min(temp[temp > 0]);
tempCO <- boxplot.stats(nnTrain$CO, coef = 20)$out;
tempCO1 <- min(tempCO[tempCO > 0]);
nnTrain$PM10[nnTrain$PM10 >= temp1] <- NA;
nnTrain$CO[nnTrain$CO >= tempCO1] <- NA;
plot(nnTrain$PM10)
plot(nnTrain$CO)  
source("F:/hell/silu/shanxi/model/emc_staModel_pre.R")
cols <- names(nnTrain);
trName <- cols[6:length(nnTrain)];
scSet <- na.inter(nnTrain, trName);
plot(scSet$PM10)
plot(scSet$CO)
scSet <- scaleByNames(scSet, trName);
maxs <- scSet[["max"]];
mins <- scSet[["min"]];
scSet <- scSet[["dat"]];
plot(scSet$PM10)
plot(scSet$CO)
# 원시 자료
ID <- c(1,2,3,4,5)
ID
SEX <- c("F","M","F","F","M")
SEX

DATA <- data.frame(ID=ID,SEX=SEX)
View(DATA)

# 엑셀 파일 불러오기
install.packages("readxl")
library(readxl)

# 데이터 불러오기
excel_data_ex <- read_excel("경로")
View(excel_data_ex)

# txt 파일 불러오기
ex_data <- read.table("경로")
ex_data <- read.table("경로",header=TRUE) # header=TRUE 데이터의 1행이 변수명으로 지정된다.
ex_data2 <- read.table("경로",header=TRUE,skip=2) # 2행까지 제외하고 1행이 변수명
ex_data3 <- read.table("경로",header=TRUE,nrows=7) # 7행까지 불러오기 실행
ex_data4 <- read.table("경로",header=TRUE,sep=",") # 쉼표로 구분되어 있는 데이터 가져오기

# 변수명 추가해서 불러오기
varname <- c("ID","SEX","AGE","AREA") 
ex_data5 <- read.table("경로",sep=",",col.names = varname)
View(ex2_data)

## rda파일로 저장하기/불러오기

# save(데이터 세트,file="파일명")
ID <- c(1,2,3,4,5)
SEX <- c("F","M","F","F","M")
data_ex <- data.frame(ID=ID,SEX=SEX)
save(data_ex,file="data_ex.rda")

# load("경로/파일명")
load("경로")

# CSV파일로 저장하기
ID <- c(1,2,3,4,5)
SEX <- c("F","M","F","F","M")
data_ex <- data.frame(ID=ID,SEX=SEX)
write.csv(data_ex,file="경로")

# txt파일로 저장하기
ID <- c(1,2,3,4,5)
SEX <- c("F","M","F","F","M")
data_ex <- data.frame(ID=ID,SEX=SEX)
write.table(data_ex,file="경로")

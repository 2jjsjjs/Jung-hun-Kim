## 벡터 데이터
# 숫자형 벡터 
ex_vector1 <- c(-1,0,1)
str(ex_vector1) # 변수의 속성 확인
length(ex_vector1) #  ex_vector1의 길이

# 문자형 벡터 
ex_vector2 <- c("Hello","Hi~!")
ex_vector2
ex_vector3 <- c("1","2","3")
ex_vector3
str(ex_vector2) # 변수의 속성확인
str(ex_vector3) # 변수의 속성확인

# 논리형 벡터
ex_vector4 <- c(TRUE,FALSE,TRUE,FALSE)
str(ex_vector4)

# 데이터 세트 삭제하기
remove(ex_vector2)
rm(ex_vector3)

## 행렬 데이터 
# matrix(변수명,nrow=행 갯수,ncol=열 갯수)
x <- c(1,2,3,4,5,6)
matrix(x,nrow=2,ncol=3) # 행 2개 열 3개로 구성
matrix(x,nrow=3,ncol=2) # 행 3개 열 2개로 구성 
matrix(x,nrow=3,ncol=2,byrow=T) # 왼쪽에서 오른쪽으로

## 배열 데이터
# array(변수명,dim=c(행 수,열 수,차원 수))
y <- c(1,2,3,4,5,6)
array(y,dim=c(2,2,3))

## 리스트 
list1 <- list(c(1,2,3), "Hello")
list1
str(list1)

## 데이터 프레임 만들기
# data.frame(변수명1,변수명2....)
ID <- c(1,2,3,4,5,6,7,8,9,10)
SEX <- c("F","M","F","M","M","F","F","F","M","F")
AGE <- c(50,40,28,50,27,23,56,47,20,38)
AREA <- c("서울","경기","제주","서울","서울","서울","경기","서울","인천","경기")

dataframe_ex <- data.frame(ID,SEX,AGE,AREA)
dataframe_ex

str(dataframe_ex)
dataframe_ex

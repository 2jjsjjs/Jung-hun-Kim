# 패키지 설치과정 
install.packages("KoNLP")
install.packages("multilinguer")
library(multilinguer)
install_jdk()
install.packages(c('stringr', 'hash', 'tau', 'Sejong', 'RSQLite', 'devtools'), type = "binary")
install.packages("remotes")
remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))
library(KoNLP) #최종적으로 "KoNLP" 패키지를 불러옵니다
useSystemDic()
useSejongDic()
useNIADic()

# 예제 자료
word_data <- readLines("C:/Users/Kim Jung Hun/Desktop/책 예제/애국가(가사).txt")

## 모든 행에 함수를 적용하기 위해 쓰이는 함수 sapply
# sapply(데이터,적용할 함수)
word_data2 <- sapply(word_data,extractNoun,USE.NAMES = F) # 여기서 extractNoun 함수 = 명사 추출 
add_words <- c("백두산","남산","철갑","가을","가을","달") # 단어 추가
buildDictionary(user_dic=data.frame(add_words,rep("ncn",length(add_words))),replace_usr_dic=T)
undata <- unlist(word_data2) # 벡터로 변환
undata 

# 사용빈도 확인하기
word_table <- table(undata)
word_table

# 필터링하기
undata2 <- Filter(function(x){nchar(x)>=2},undata)
word_table2 <- table(undata2)
word_table2

# 데이터 정렬하기
sort(word_table2,decreasing=T)

# 워드클라우드만들기
library(wordcloud2)
wordcloud2(word_table2)

# 배경 등 색상 변경하기
wordcloud2(word_table2,color="random-light",backgroundColor = "black")

# 모양 변경하기
wordcloud2(word_table2,fontFamily = "밝은 고딕",size=1.2,color="random-light",backgroundColor="black",shape="star")

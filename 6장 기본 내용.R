## 실습 데이터 확인 및 패키지 로드
nrow(mtcars) # 행 갯수 확인
str(mtcars) # 데이터 속성 확인
library(dplyr)

## 데이터 추출 및 정렬
filter(mtcars,cyl==4) # cyl 값이 4인 행만 추출 
filter(mtcars,cyl>=6 & mpg > 20)

## 정렬하기
head(arrange(mtcars,wt)) # wt를 기준으로 오름차순 정렬
head(arrange(mtcars,mpg,desc(wt))) # 첫번째로 mpg를 기준으로 오름차순 , 두번째로 wt를 기준으로 내림차순

## 변수 선택하기
head(select(mtcars,am,gear)) # am,gear변수 선택하기

## 열 추가하기
# mutate(데이터 세트, 추가할 열 이름 = 조건1,....)
head(mutate(mtcars,years="1974"))
head(mutate(mtcars,mpg_rank=rank(mpg)))

## 중복값제거하기
distinct(mtcars,cyl)
distinct(mtcars,gear)
distinct(mtcars,cyl,gear)

## 데이터 요약하기
# summarise(데이터세트,요약결과 저장 열=통계함수)
summarise(mtcars,cyl_mean=mean(cyl),cyl_min=min(cyl),cyl_max=max(cyl)) # 평균,최솟값,최댓값
summarise(mtcars,mean(cyl),min(cyl),max(cyl))

## 그룹별 요약하기
gr_cyl <- group_by(mtcars,cyl)
summarise(gr_cyl,n()) # 3개 그룹 그리고 갯수
gr_cyl <- group_by(mtcars,cyl)
summarise(gr_cyl,n_distinct(gear))
gr_cyl <- group_by(mtcars,cyl)
summarise(gr_cyl,n_distinct(gear))

## 생플 추출하기
sample_n(mtcars,10)
sample_frac(mtcars,0.2) #전체 데이터의 20%를 샘플로 추출

## 파이프라인
# 데이터 세트 %>% 조건 또는 계산 %>% 데이터 세트 
group_by(mtcars,cyl) %>% summarise(n()) # 그룹으로 묶고 갯수
mp_rank <- mutate(mtcars,mpg_rank=rank(mpg))
arrange(mp_rank,mpg_rank)
mutate(mtcars,mpg_rank=rank(mpg)) %>% arrange(mpg_rank) # 위의 식과 똑같음 


# 3.1.1 준비하기
library(nycflights13)
library(tidyverse)
flights

# 3.1.3 dplyr 기초
# 핵심함수 : filter,arrange,select,mutate,summrize

# 3.2 행 필터링하기(filter)

filter(flights,month==1,day==1)
jan1 <- filter(flights,month==1,day==1)
dec25 <- filter(flights,month==12,day==25)
filter(flights,month==11|month==12) # 11,12월인 행을 모두 불러온다 
nov_dec <- filter(flights,month %in% c(11,12)) # 11월이나 12월인 행은 불러온다

# 드모르간 법칙
## 두 시간 이상 지연되지 않은 항공편을 모두 찾고 싶다
filter(flights, !(arr_delay>120 | dep_delay>120)) 
filter(flights,arr_delay <= 120, dep_delay <= 120)

# 결측값이 있는지를 찾고싶다
is.na(x)

df <- tibble(x=c(1,NA,3))
filter(df,x>1)
filter(df,is.na(x)|x>1)

# 3.2.4 연습문제
## 1. 
str(flights) 
# a. 2시간 이상 도착 지연.

filter(flights,arr_delay >= 120)


# b. 휴스턴으로 운항
filter(flights,dest=="IAH" | dest=="HOU")

# c. 유나이티드항공,아메리칸항공,델타항공이 운항.
filter(flights,carrier %in% c("UA","AA","DL"))

# d. 여름에 출발 
filter(flights,month %in% c(7,8,9))

# e. 2시간이상 지연 도착했지만 , 지연 출발하지는 않음
filter(flights,arr_delay>120 , dep_delay <= 0)

# f. 최소 한시간 이상 지연 출발했지만 운항 중 30분 이상 단축.
filter(flights,dep_delay>=60,dep_delay-arr_delay>30)

# g. 자정과 6am 사이에 출발 
filter(flights,dep_time <= 600 | dep_time ==2400)

## 2.
filter(flights,between(month,7,9))
    # 7 <= month <= 9 를 쓰고자 할 때 between을 사이에 끼어서 쓸 수 있다.

## 3. 
filter(flights,is.na(dep_time))
    # 취소된 운항편으로 보인다.

## 4. 
NA^0
NA | TRUE
FALSE & NA
    # 기본적으로 1의 값을 갖기 때문이다.

# 3.3 행 정렬하기(arrange)
arrange(flights,year,month,day)
arrange(flights,desc(arr_delay)) # 내림차순

df <- tibble(x=c(5,2,NA))
arrange(df,x)
arrange(df,desc(x)) # 결측값은 맨 마지막에 정렬된다

# 3.3.1 연습문제
## 1.
arrange(flights, dep_time) %>% tail()
arrange(flights,desc(is.na(dep_time)))
arrange(flights,desc(is.na(dep_time)),dep_time)

## 2.
arrange(flights,dep_delay)
arrange(flights,desc(dep_delay))

## 3. 
head(arrange(flights,air_time))
# fastest flight = distance / air_time
head(arrange(flights,desc(distance/air_time)))

## 4. 
arrange(flights,desc(distance))
arrange(flights,distance)

## 5. 
select(flights,year,month,day) # 이름으로 열 선택
select(flights,year:day) # 열 모두 선택
select(flights,-(year:day)) # 열들을 제외한 열 모두 선택
rename(flights,tail_num=tailnum) # 언급하지 않은 모든 변수를 유지한다.
select(flights,time_hour,air_time,everything()) # 몇개의 변수를 시작부분으로 옮기고 싶을 때

# 3.4.1 연습문제
## 1. 
select(flights,dep_time,dep_delay,arr_time,arr_delay)
select(flights,4,6,7,9)
select(flights,any_of(c("dep_time","del_delay","arr_time","arr_delay")))

## 2.
select(flights,year,month,day,year,year) 
    # 특별한 오류 메시지 없이 처음나타나는 위치에 한번만 나타난다.

## 3. 
vars <- c("year","month","day","dep_delay","arr_delay")
select(flights,one_of(vars))
select(flights,any_of((vars)))
select(flights,all_of(vars))
    # all_of 함수의 경우 하나라도 빠지면 오류메시지가 뜨고, one_of 의 경우에도 없는 변수가 있으면 오류메시지가 뜬다.

## 4. 
select(flights,contains("TIME")) # 대소문자를 모두 무시한다.
select(flights,contains("TIME",ignore.case=FALSE)) # 위 조건을 끄고싶으면 해당 옵션을 추가하면 된다.

# 3.5 mutate(새로운 변수 추가하기)
flights_sml <- select(flights,
                      year:day,
                      ends_with("delay"),
                      distance,
                      air_time)
mutate(flights_sml,gain=arr_delay-dep_delay,speed=distance/air_time*60)
mutate(flights_sml,gain=arr_delay-dep_delay,hours=air_time/60,gain_per_hour=gain/hours) # 방금 생성한 열을 참조 할 수 있다.
transmute(flights,gain=arr_delay-dep_delay,hours=air_time/60,gain_per_hour=gain/hours) # 생성한 변수만 남기고 싶을 때 쓰는 함수.
transmute(flights,dep_time,hour=dep_time %/% 100,minute=dep_time %% 100) # %/% 정수나누기 , %% 나머지

x <- 1:10
lag(x)
lead(x)
cumsum(x) # 누적합
cummean(x) # 누적평균

y <- c(1,2,2,NA,3,4)
min_rank(y)
min_rank(desc(y))

row_number(y)
dense_rank(y)
percent_rank(y)
cume_dist(y)




       




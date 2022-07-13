library(tidyverse)
ggplot(data=diamonds)+
    geom_bar(mapping=aes(x=cut))

diamonds %>%
    count(cut) # 관측값의 수를 수동으로 계산할 수 있다.

ggplot(data=diamonds)+
    geom_histogram(mapping=aes(x=carat),binwidth=0.5)

diamonds %>%
    count(cut_width(carat,0.5))

smaller <- diamonds %>%
    filter(carat < 3)

ggplot(data=smaller,mapping=aes(x=carat))+
    geom_histogram(binwidth=0.1)

ggplot(data=smaller,mapping=aes(x=carat,color=cut))+
    geom_freqpoly(binwidth=0.1)
    # 히스토그램 겹쳐서 그리기 

ggplot(data=smaller,mapping=aes(x=carat))+
    geom_histogram(binwidth=0.01)

ggplot(data=faithful,mapping=aes(x=eruptions))+
    geom_histogram(binwidth=0.25)

ggplot(diamonds)+
    geom_histogram(mapping=aes(x=y),binwidth=0.5)

ggplot(diamonds)+
    geom_histogram(mapping=aes(x=y),binwidth=0.5)+
    coord_cartesian(ylim=c(0,50)) # x축 확대

unusual <- diamonds %>% 
    filter(y<3|y>20) %>%
    select(price,x,y,z) %>%
    arrange(y)

## 5.3.4 연습문제
# 1. 
## 변수에 대해 요약 통계
summary(select(diamonds, x, y, z))
## 분포에 대해 플로팅 
ggplot(diamonds) +
geom_histogram(mapping = aes(x = x), binwidth = 0.01)
    # x및 의 일반적인 값은 4.7???6.5의 사분위수 범위

ggplot(diamonds) +
    geom_histogram(mapping = aes(x = y), binwidth = 0.01)
    #  y 사분위수 범위는 2.9???4.0

ggplot(diamonds) +
    geom_histogram(mapping = aes(x = z), binwidth = 0.01)

filter(diamonds, x == 0 | y == 0 | z == 0)

diamonds %>%
    arrange(desc(y)) %>%
    head()
    # 비정상적으로 큰 다이아몬드도 존재 

diamonds %>%
    arrange(desc(z)) %>%
    head()

ggplot(diamonds, aes(x = x, y = y)) +
    geom_point()

ggplot(diamonds, aes(x = x, y = z)) +
    geom_point()

ggplot(diamonds, aes(x = y, y = z)) +
    geom_point()

filter(diamonds, x > 0, x < 10) %>%
    ggplot() +
    geom_histogram(mapping = aes(x = x), binwidth = 0.01) +
    scale_x_continuous(breaks = 1:10)

filter(diamonds, y > 0, y < 10) %>%
    ggplot() +
    geom_histogram(mapping = aes(x = y), binwidth = 0.01) +
    scale_x_continuous(breaks = 1:10)  

filter(diamonds, z > 0, z < 10) %>%
    ggplot() +
    geom_histogram(mapping = aes(x = z), binwidth = 0.01) +
    scale_x_continuous(breaks = 1:10)    

summarise(diamonds, mean(x > y), mean(x > z), mean(y > z))

# 2.
ggplot(filter(diamonds, price < 2500), aes(x = price)) +
    geom_histogram(binwidth = 10, center = 0)

ggplot(filter(diamonds), aes(x = price)) +
    geom_histogram(binwidth = 100, center = 0)

diamonds %>%
    mutate(ending = price %% 10) %>%
    ggplot(aes(x = ending)) +
    geom_histogram(binwidth = 1, center = 0)

diamonds %>%
    mutate(ending = price %% 100) %>%
    ggplot(aes(x = ending)) +
    geom_histogram(binwidth = 1)

diamonds %>%
    mutate(ending = price %% 1000) %>%
    filter(ending >= 500, ending <= 800) %>%
    ggplot(aes(x = ending)) +
    geom_histogram(binwidth = 1)

# 3.
diamonds %>%
    filter(carat >= 0.99, carat <= 1) %>%
    count(carat)

# 위의 과정 보완

diamonds %>%
    filter(carat >= 0.9, carat <= 1.1) %>%
    count(carat) %>%
    print(n = Inf)

# 4.
ggplot(diamonds) +
    geom_histogram(mapping = aes(x = price)) +
    coord_cartesian(xlim = c(100, 5000), ylim = c(0, 3000))

ggplot(diamonds) +
    geom_histogram(mapping = aes(x = price)) +
    xlim(100, 5000) +
    ylim(0, 3000)

## 5.4 결측값
diamonds2 <- diamonds %>% filter(between(y,3,20))
    # 이상값이 포함된 행 전체를 삭제한다.
diamonds2 <- diamonds %>% mutate(y=ifelse(y<3|y>20,NA,y))
    # 이상값을 결측값으로 변경하는 방법
ggplot(data=diamonds2,mapping=aes(x=x,y=y))+
    geom_point()
ggplot(data=diamonds2,mapping=aes(x=x,y=y))+
    geom_point(na.rm=TRUE)
    # 경고를 숨기려면 

nycflights13::flights %>%
    mutate(
        cancelled=is.na(dep_time),
        sched_hour=sched_dep_time %/% 100,
        sched_min = sched_dep_time %% 100,
        sched_dep_time = sched_hour+sched_min / 60
) %>% 
ggplot(mapping=aes(sched_dep_time))+
    geom_freqpoly(
        mapping=aes(color=cancelled),
        binwidth = 1/4)

# 5.4.1 연습문제
## 1.
diamonds2 <- diamonds %>%
    mutate(y = ifelse(y < 3 | y > 20, NA, y))
ggplot(diamonds2, aes(x = y)) +
    geom_histogram()
diamonds %>%
    mutate(cut = if_else(runif(n()) < 0.1, NA_character_, as.character(cut))) %>%
    ggplot() +
    geom_bar(mapping = aes(x = cut))

## 2.
mean(c(0, 1, 2, NA), na.rm = TRUE)
sum(c(0, 1, 2, NA), na.rm = TRUE)
    # 벡터에서 값을 제거한다.

ggplot(data=diamonds,mapping=aes(x=price))+
    geom_freqpoly(mapping=aes(color=cut),binwidth=500)

ggplot(diamonds)+
    geom_bar(mapping=aes(x=cut))

ggplot(
    data=diamonds,
    mapping=aes(x=price,y=density)+
        geom_freqpoly(mapping=aes(color=cut),binwidth=500)
)

ggplot(data=diamonds,mapping=aes(x=cut,y=price))+
    geom_boxplot()

ggplot(data=mpg,mapping=aes(x=class,y=hwy))+
    geom_boxplot()

ggplot(data=mpg)+
    geom_boxplot(
        mapping=aes(
            x=reorder(class,hwy,FUN=median),
            y=hwy)) # hwy 변수를 중간값으로 class 변수의 순서를 변경 

ggplot(data=mpg)+
    geom_boxplot(mapping=aes(x=reorder(class,hwy,FUN=median),y=hwy))+coord_flip()
    # 보기 힘든 경우에는 90도 회전하면 더 잘 나타낼 수 있다.

# 5.5.2 연습문제
## 1.
nycflights13::flights %>%
    mutate(
        cancelled = is.na(dep_time),
        sched_hour = sched_dep_time %/% 100,
        sched_min = sched_dep_time %% 100,
        sched_dep_time = sched_hour + sched_min / 60
    ) %>%
    ggplot() +
    geom_boxplot(mapping = aes(y = sched_dep_time, x = cancelled))

## 2.
ggplot(diamonds, aes(x = carat, y = price)) +
    geom_point()

ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
    geom_boxplot(mapping = aes(group = cut_width(carat, 0.1)), orientation = "x")

diamonds %>%
    mutate(color = fct_rev(color)) %>%
    ggplot(aes(x = color, y = price)) +
    geom_boxplot()

ggplot(data = diamonds) +
    geom_boxplot(mapping = aes(x = clarity, y = price))

ggplot(diamonds, aes(x = cut, y = carat)) +
    geom_boxplot()

ggplot(data = mpg) +
    geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median), y = hwy)) +
    coord_flip()

install.packages("ggstance")
library("ggstance")

ggplot(data = mpg) +
    geom_boxploth(mapping = aes(y = reorder(class, hwy, FUN = median), x = hwy))

ggplot(data = mpg) +
    geom_boxplot(mapping = aes(y = reorder(class, hwy, FUN = median), x = hwy), orientation = "y")

ggplot(diamonds, aes(x = cut, y = price)) +
    geom_lv()

# 5.
ggplot(data = diamonds, mapping = aes(x = price, y = ..density..)) +
    geom_freqpoly(mapping = aes(color = cut), binwidth = 500)

ggplot(data = diamonds, mapping = aes(x = price)) +
    geom_histogram() +
    facet_wrap(~cut, ncol = 1, scales = "free_y")
#> `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
    geom_violin() +
    coord_flip()

install.packages("ggbeeswarm")
library(ggbeeswarm)
ggplot(data = mpg) +
    geom_quasirandom(mapping = aes(
        x = reorder(class, hwy, FUN = median),
        y = hwy))

# 6.
ggplot(data = mpg) +
    geom_quasirandom(
        mapping = aes(
            x = reorder(class, hwy, FUN = median),
            y = hwy
        ),
        method = "tukey"
    )

# 5.5.3 두개의 범주형 변수
ggplot(data=diamonds)+
    geom_count(mapping=aes(x=cut,y=color))

diamonds %>% 
    count(color,cut)

diamonds %>% 
    count(color,cut) %>% 
    ggplot(mapping=aes(x=color,y=cut)) +
        geom_tile(mapping=aes(fill=n))
    # geom_tile()함수와 fill 심미성으로 시각화한다.

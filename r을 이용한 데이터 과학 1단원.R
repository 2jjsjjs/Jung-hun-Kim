install.packages("tidyverse")
library(tidyverse)
## 1.2 첫 단계

# mpg 데이터 프레임 
ggplot(data=mpg)+
    geom_point(mapping=aes(x=displ,y=hwy))
# -> 분석 결과 displ과 hwy 사이에 음의 관계가 있음을 볼 수 있다. 

ggplot(data=mpg)+
    geom_point(aes(x=displ,y=hwy)) # mapping 을 생략해서 써도 된다.

## 연습문제 1.2.4
# 1. 
ggplot(data=mpg)
    # 아무것도 안나타남

# 2. 
dim(mpg)
    # 234  11

# 3.
?mpg 
    #( drv the type of drive train, where f = front-wheel drive, r = rear wheel drive, 4 = 4wd)

# 4. 
plot(mpg$hwy,mpg$cyl)

# 5.
plot(mpg$class,mpg$drv)
    # 유한한값이 아니라서 x축에 쓸 수 없다

## 1.3 심미성 매핑 
ggplot(data=mpg) +
    geom_point(mapping=aes(x=displ,y=hwy,color=class)) # 종류를 색깔로 분류 

ggplot(data=mpg) +
    geom_point(mapping=aes(x=displ,y=hwy,size=class)) # 종류를 크기로 분류

ggplot(data=mpg) +
    geom_point(mapping=aes(x=displ,y=hwy,alpha=class)) # 점의 투명도

ggplot(data=mpg) +
    geom_point(mapping=aes(x=displ,y=hwy,shape=class)) # 점의 모양

ggplot(data=mpg) +
    geom_point(mapping=aes(x=displ,y=hwy),color="blue") # aes 외부로 해서 blue 가 될 수 있음

# 1.3.1 연습문제
# 1.
ggplot(data=mpg) +
    geom_point(mapping=aes(x=displ,y=hwy,color="blue"))

# 2. 
str(mpg)
    # str 함수를 이용해서 범주형인지 연속형인지를 판별할수있다.
    # 범주형 : manufacturer, model, trans, drv, f1, class, cyl
    # 연속형 : displ, cty, hwyl , year

# 3.
ggplot(data=mpg) +
    geom_point(mapping=aes(x=year,y=hwy,color=class,shape=class,size=class))
    
# 4.
    # 모두 반영되어 나타나며 그래프에 많은 정보를 포함할 수 있다.

# 5. 
ggplot(data=mpg) +
    geom_point(mapping=aes(x=displ,y=hwy,stroke=5))

# 직접 비교

ggplot(data=mpg) +
    geom_point(mapping=aes(x=displ,y=hwy))

    # 점의 크기, 점의 테두리의 크기 정도

# 6.
ggplot(data=mpg) +
    geom_point(mapping=aes(x=displ,y=hwy,color=displ<5))
    
    # TRUE, FALSE의 형태로 나타난다.

# 1.5 FACET
ggplot(data=mpg)+
    geom_point(mapping=aes(x=displ,y=hwy))+
    facet_wrap(~class,nrow=2)
    
    # facet_wrap()에 전달하는 변수는 이산형이어야하며 ~뒤에는 변수이름이 따라오는 공식

ggplot(data=mpg)+
    geom_point(mapping=aes(x=displ,y=hwy))+
    facet_grid(drv~cyl)

    # 2개의 변수로 면분할 하기 위해서

ggplot(data=mpg)+
    geom_point(mapping=aes(x=displ,y=hwy))+
    facet_grid(.~cyl)
    
    # 면 분할 하기 싫다면 .~

# 1.5.1 연습문제
# 1. 

ggplot(data=mpg)+
    geom_point(mapping=aes(x=displ,y=hwy))+
    facet_grid(cty~cyl)

    # 연속형 변수마다로 면 분할 된다.
# 2. 

ggplot(data=mpg)+
    geom_point(mapping=aes(x=displ,y=hwy))+
    facet_grid(drv~cyl)
ggplot(data=mpg)+
    geom_point(mapping=aes(x=drv,y=cyl))

    # 해당 drv값, cyl 값을 만족하는 데이터가 없음을 의미한다. drv, cyl 모두 명목형 변수이기 때문에 위 코드의 그래프를 그리면 점이 찍히지 않은 곳이 있다. 그 점이 비어있는 이유는 데이터가 없기 때문이다.

# 3. 

ggplot(data=mpg) +
    geom_point(mapping=aes(x=displ,y=hwy))+
    facet_grid(drv~.)

ggplot(data=mpg)+
    geom_point(mapping=aes(x=displ,y=hwy))+
    facet_grid(.~cyl)

    # 첫 번째 코드는 drv 변수를 행 기준으로 면 분할 하고, 두 번째 코드는 cyl 변수를 열 기준으로 면 분할 한다. 여기서 . 는 행 또는 열 분할만을 할 때 사용한다.

# 4. 

ggplot(data=mpg)+
    geom_point(mapping=aes(x=displ,y=hwy))+
    facet_wrap(~class,nrow=2)

# 5.

?facet_wrap

    # facet_wrap() wraps a 1d sequence of panels into 2d.
    # nrow, ncol = Number of rows and columns.
?facet_grid

    # facet_grid의 경우 1차원이고 facet_wrap의 경우에는 2차원이기때문에 nrow,ncol의 인수가 없다.

# 6.

    # 그래프는 주로 세로로 길게 나타낸다. 따라서 고유 수준이 더 많은 변수를 열로 두어야 행의 수가 줄어들어 그래프가 세로로 길게 나타낼 수 있다.


# 1.6 기하 객체

ggplot(data=mpg)+
    geom_point(mapping=aes(x=displ,y=hwy))

ggplot(data=mpg)+
    geom_smooth(mapping=aes(x=displ,y=hwy))

ggplot(data=mpg)+
    geom_smooth(mapping=aes(x=displ,y=hwy,linetype=drv))


ggplot(data=mpg)+
    geom_smooth(mapping=aes(x=displ,y=hwy)) # 일반

ggplot(data=mpg)+
    geom_smooth(mapping=aes(x=displ,y=hwy,group=drv)) # 색깔에 따른 구분

ggplot(data=mpg)+
    geom_smooth(mapping=aes(x=displ,y=hwy,color=drv),
                show.legend = FALSE) # 범례 추가

ggplot(data=mpg)+
    geom_smooth(mapping=aes(x=displ,y=hwy))+
    geom_point(mapping=aes(x=displ,y=hwy))

ggplot(data=mpg,mapping=aes(x=displ,y=hwy))+
    geom_point(mapping=aes(color=class))+
    geom_smooth()

ggplot(data=mpg,mapping=aes(x=displ,y=hwy))+
    geom_point(mapping=aes(color=class))+
    geom_smooth(
        data=filter(mpg,class=="subcompact"),
        se=FALSE) # 평활선이 MPG 데이터셋의 서브셋인 경차만을 표시한다.

# 1.6.1 연습문제
# 1.
    
    # 선 그래프 : geom_smooth() , 박스 플롯 : geom_boxplot , 히스토그램 : geom_histogram() , 면적 차트 : geom_area()

# 2. 
ggplot(
    data=mpg,
    mapping=aes(x=displ,y=hwy,color=drv)
    ) +
    geom_point() +
    geom_smooth(se=FALSE)

# 3.

    # show.legend 는 범례표시 유무를 결정한다. 따라서 FALSE일 경우 범례가 표시되지않는다 show.legend = FALSE 를 삭제하면 범례가 표시되는 것을 알 수 있다.

# 4. 
ggplot(
    data=mpg,
    mapping=aes(x=displ,y=hwy,color=drv)
) +
    geom_point() +
    geom_smooth()

    # se 옵션은 추정된 smooth line의 표준오차 출력 여부를 결정한다. 따라서 FALSE일 경우 표준오차를 출력하지 않는다.

# 5.
    # 1 
ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+
    geom_point()+
    geom_smooth()

    # 2
ggplot()+
    geom_point(data = mpg, mapping = aes(x = displ, y = hwy))+
    geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

    # 두 그래프는 같게 나타난다.

# 6.
 # 1
ggplot(data = mpg, mapping = aes(x = displ, y = hwy))+
    geom_point()+
    geom_smooth(se = FALSE)

 # 2
ggplot(data =mpg, mapping = aes(x = displ, y = hwy))+
geom_point()+
    geom_smooth(mapping = aes(x = displ, y = hwy, group = drv), se = FALSE)

 # 3
ggplot(data =mpg, mapping = aes(x = displ, y = hwy, color = drv))+
    geom_point()+
    geom_smooth(mapping = aes(x = displ, y = hwy, group = drv), se = FALSE)

 # 4
ggplot(data =mpg)+
    geom_point(mapping = aes(x = displ, y = hwy, color = drv))+
    geom_smooth(mapping = aes(x = displ, y = hwy),se = FALSE)
 # 5
ggplot(data =mpg)+
    geom_point(mapping = aes(x = displ, y = hwy, color = drv))+
    geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv),se = FALSE)

 # 6
ggplot(mpg, aes(x = displ, y = hwy)) +
    geom_point(size = 4, color = "white") +
    geom_point(aes(colour = drv))


# 1.7 통계적 변환

# 막대그래프
ggplot(data=diamonds) +
    geom_bar(mapping=aes(x=cut))

demo <- tribble(
    ~cut, ~freq,
    "Fair", 1610,
    "Good", 4906,
    "Very Good", 12082,
    "Premium", 13791,
    "Ideal", 21551)

ggplot(data=demo) +
    geom_bar(mapping=aes(x=cut,y=freq),stat="identity") # y변수의 원값으로 매핑

ggplot(data=diamonds) +
    geom_bar(
        mapping=aes(x=cut,y=..prop..,group=1)
    )


ggplot(data=diamonds)+
    stat_summary(
        mapping=aes(x=cut,y=depth),
        fun.ymin=min,
        fun.ymax=max,
        fun.y=median
)

# 1.7.1 연습문제
# 1. 

ggplot(data = diamonds)+
    geom_pointrange(
        mapping = aes(x = cut, y = depth),
        fun.min = min,
        fun.max = max,
        fun = median,
        stat = "summary")

# 2. 

# geom_bar
ggplot(data = diamonds)+
    geom_bar(mapping = aes(x = cut))

#geom_col
ggplot(data = diamonds)+
    geom_col(mapping = aes(x = cut, y = depth))

    # geom_col의 경우에는 막대의 높이가 데이터의 값을 나타내며 , geom_bar의 경우에는 데이터의 갯수를 나타낸다 

# 3. pass 도움말 참조
# 4. 
    # stat_smooth() 는 geom_smooth() 와 같은 그래프를 그려 과적합 여부를 판별하는데 도움을 준다. 이 두 함수는 동일한 기능을 하지만 비표준도형으로 결과를 출력할 경우 stat_smooth() 를 사용한다. (?stat_smooth)

# 5. 
# plot 1
ggplot(data = diamonds)+
    geom_bar(mapping = aes(x = cut, y = ..prop..))

# plot 2
ggplot(data = diamonds)+
    geom_bar(mapping = aes(x = cut, fill = color, y = ..prop..))

    # 상대 빈도는 group 속성에 따라 계산을 하는데, 전체 데이터를 대상으로 상대 빈도를 구하기 위해 모든 데이터가 동일한 그룹이 되도록 group=1로 설정을 한다.

# 1.8 위치 조정
ggplot(data=diamonds)+
    geom_bar(mapping=aes(x=cut,color=cut))

ggplot(data=diamonds)+
    geom_bar(mapping=aes(x=cut,fill=cut))

ggplot(data=diamonds)+
    geom_bar(mapping=aes(x=cut,fill=clarity))  # 누적 막대 그래프

ggplot(data=diamonds,
    mapping=aes(x=cut,fill=clarity))+
    geom_bar(alpha=1/5,position="identity") # 각 객체를 그래프 문맥에 해당되는 곳에 정확히 배치

ggplot(data=diamonds,mapping=aes(x=cut,color=clarity))+
    geom_bar(fill=NA,position="identity") # 겹치는 거 구별하려고 alpha 를 작은 값으로 설정해서 막대를 투명하게 하거나 fill = na 옵션을 통해서 설정 

ggplot(data=diamonds)+
    geom_bar(
        mapping=aes(x=cut,fill=clarity),
        position="fill") # 높이를 똑같이 맞추므로서 비율을 비교하기 쉬워진다.

ggplot(data=diamonds)+
    geom_bar(
        mapping=aes(x=cut,fill=clarity),
        position="dodge") # 개별값들을 비교하기 쉬워진다 겹치는 객체가 바로 옆에 배치되기 때문에

ggplot(data=mpg)+
    geom_point(
        mapping=aes(x=displ,y=hwy),
        position="jitter") # 랜덤 노이즈 추가

# 1.8.1 연습문제

# 1.
    ggplot(data=mpg,mapping=aes(x=cty,y=hwy))+
        geom_point()

    # cty와 hwy의 값이 중첩되도록 반올림하여 나타내기 때문에 위와 같은 그래프가 만들어진다. 따라서 이 문제를 해결하기 위해서는 position = jitter 을 추가해 그래프를 그린다.    
    
    ggplot(data=mpg,mapping=aes(x=cty,y=hwy))+
        geom_point(position="jitter")
    
# 2.
    # 지터링의 양은 width 와 height 옵션에서 제어할 수 있다.

# 3.

# geom_jitter
ggplot(data = mpg) +
    geom_jitter(mapping = aes(x = drv, y = displ ))
  
# geom_count
ggplot(data = mpg)+
    geom_count(mapping = aes(x = drv, y = displ))

# 4.
ggplot(data = mpg) +
    geom_boxplot(mapping = aes(y = displ, x = drv, color = factor(year)))

# 1.9 좌표계
ggplot(data=mpg,mapping=aes(x=class,y=hwy)) +
    geom_boxplot()

ggplot(data=mpg,mapping=aes(x=class,y=hwy)) + 
    geom_boxplot() +
    coord_flip() 
    # x와 y축을 바꾸는 coord_flip()

library(dplyr)
nz <- map_data("nz")

ggplot(nz,aes(long,lat,group=group)) +
    geom_polygon(fill="white",colour="black")

ggplot(nz,aes(long,lat,group=group)) + 
    geom_polygon(fill="white",colour="black") + 
    coord_quickmap()

bar <- ggplot(data=diamonds) +
    geom_bar(
        mapping=aes(x=cut,fill=cut),
        show.legend=FALSE,
        width = 1) + 
    theme(aspect.ratio=1) +
    labs(x=NULL,y=NULL)

bar + coord_flip()
bar + coord_polar()

# 1.9.1 연습문제

# 1.
bar <- ggplot(data=diamonds) + 
        geom_bar(mapping=aes(x=cut,fill=clarity),
                 show.legend=FALSE,
                 width=1)
bar + coord_polar()

# 2. 
    # 각각 x축과 y축에 이름을 지정할 수 있다. 만약 NULL인 경우 각 축에 이름이 붙지 않는다.

# 3.
    # coord_map() 를 통해 지도의 상세한 모습을 불러 올 수 있다. 다만 coord_quickmap 는 ggplot2패키지에서 바로 사용할 수 있으며, coord_map() 보다 불러오는 속도가 빠르다.

# 4. 
ggplot(data = mpg, mapping = aes(x = cty, y = hwy))+
    geom_point()+
    geom_abline()+
    coord_fixed()
    # 도심 연비( cty )가 증가함에 따라 고속도로 연비( hwy )가 증가하는 양의 상관관계를 갖고있다.

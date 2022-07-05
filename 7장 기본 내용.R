library(ggplot2)
str(airquality)
ggplot(airquality,aes(x= day ,y= temp)) # x,y축 고정

# 산점도
ggplot(airquality,aes(x=day,y=temp))+geom_point() # 평면에 관측점
ggplot(airquality,aes(x=day,y=temp))+geom_point(size=3,color="red") # 색깔, 점 크기

# 꺾은선그래프
ggplot(airquality,aes(x=day,y=temp))+geom_line()

# 그래프에 그래프 더하기
ggplot(airquality,aes(x=day,y=temp))+geom_line()+geom_point()

# 막대그래프
ggplot(mtcars,aes(x=cyl))+geom_bar(width=0.5) # width = 막대 두께
ggplot(mtcars,aes(x=factor(cyl)))+geom_bar(width=0.5) # 없는 x축에 자료 제외

# 누적막대그래프
ggplot(mtcars,aes(x=factor(cyl)))+geom_bar(aes(fill=factor(gear))) # aes함수에는 누적할 열 지정

# 누적막대그래프를 이용해서 선버스트 차트 그리기
ggplot(mtcars,aes(x=factor(cyl))) # cyl열을 x축으로 지정
    +geom_bar(aes(fill=factor(gear)))+ #  cyl종류별 gear 빈도파악
    coord_polar() # 선버스트 차트로 변환 

# 원그래프 그리기
ggplot(mtcars,aes(x=factor(cyl))) # cyl열을 x축으로 지정
    +geom_bar(aes(fill=factor(gear)))+ # cyl 종류별 gear 빈도 파악
    coord_polar(theta="y") # 원그래프로 변환

# 상자 그림 그리기
ggplot(airquality,aes(x=day,y=temp,group=day))+
    geom_boxplot()

# geom_histogram함수
ggplot(airquality,aes(temp))+
    geom_histogram()

ggplot(airquality,aes(temp))+
    geom_histogram(binwidth = 1) # binwidth = 비율 

# 데이터 속성 파악
str(economics)

# 사선 , geom_abline() 함수
ggplot(economics,aes(x=date,y=psavert))+
    geom_line()+ # 꺾은선그래프 그리기
    geom_abline(intercept=12.18671,slope=-0.0005444)
 
# 평행선 , geom_hline() 함수
ggplot(economics,aes(x=date,y=psavert))+
    geom_line()+
    geom_hline(yintercept=mean(economics$psavert)) # 평균값으로 평행선 그리기 

# 수직선, geom_vline() 함수
x_inter <- filter(economics,psavert==min(economics$psavert))$date

ggplot(economics,aes(x=date,y=psavert))+
    geom_line()+ # 꺾은선 그래프 그리기 
    geom_vline(xintercept=x_inter) # x_inter 변수 값으로 수직선 그리기

# 텍스트,geom_text() 함수
# geom_text(aes(label=라벨명,vjust=세로위치,hjust=가로위치))
ggplot(airquality,aes(x=day,y=temp))+
    geom_point()+
    geom_text(aes(label=temp,vjust=0,hjust=0)) # 각점에 temp 값 입력하기

# 도형 및 화살표, annotate() 함수
# annotate("모양",xmin=x축시작,xmax=x축 끝,ymin=y축 시작, ymax=y축 끝)
ggplot(mtcars,aes(x=wt,y=mpg))+
    geom_point()+
    annotate("rect",xmin= 3,xmax = 4,ymin= 12,ymax= 21,alpha= 0.5,fill="skyblue") # x축 3~4,y축 12~21 , 위치에 하늘색 투명한(alpha=0.5) 사각형

# 사각형 화살표 그리기
ggplot(mtcars,aes(x=wt,y=mpg))+
    geom_point()+
    annotate("rect",xmin= 3,xmax = 4,ymin= 12,ymax= 21,alpha= 0.5,fill="skyblue")+
    annotate("segment",x=2.5,xend=3.7,y=10,yend=17,color="red",arrow=arrow())

# 사각형 화살표 레이블 추가하기
ggplot(mtcars,aes(x=wt,y=mpg))+
    geom_point()+
    annotate("rect",xmin= 3,xmax = 4,ymin= 12,ymax= 21,alpha= 0.5,fill="skyblue")+
    annotate("segment",x=2.5,xend=3.7,y=10,yend=17,color="red",arrow=arrow())+
    annotate("text",x=2.5,y=10,label="point")

# 막대그래프에 제목 추가하기
ggplot(mtcars,aes(x=gear))+geom_bar()+
    labs(x="기어수",y="자동차수",title="변속기 기어별 자동차수")



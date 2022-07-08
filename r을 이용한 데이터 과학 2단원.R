# 2.3.1 연습문제
# 1. 
my_variable <- 10
my_variable
 # 철자가 틀려서 변수가 실행이 안됨.
# 2.
library(tidyverse)
ggplot(data=mpg)+
    geom_point(mapping=aes(x=displ,y=hwy))

filter(mpg,cyl==8)
filter(diamonds,carat>3)



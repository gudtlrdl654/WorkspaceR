#eda+문제정의 / 문제는 주말에 / 월욜부터 개인 발표 / 샘플 제공 해줌 / ppt로 작업 / 글쓰기 + 데이터 분석 + 발표  

#
# 분석절차 
# 1. 문제 정의
# 2. 자료 수집 
# 3. 자료 전처리 -수집한 자료가 항상 완벽하지 않기 때문에 자료를 완벽하게 수정하는 단계(더 많은 시간이 들어갈수도)
# 4. 자료 탐색(EDA)


#
# TextFile 읽기 
setwd( "C:\\workspace\\workspaceR" ) #setwd("directory경로") : Directory 변경 함수 / \는 반드시 2개  or / 쓰기  
df <- read.table( file = "airquailty.txt", header = T ) 

calss( df )


#
# Excel 파일 읽기
# 
# Excel 파일 읽기용 패키지 설치
install.packages( "xlsx" )       # Excel 파일 읽기 패키지
install.packages( "rJava" )      # java 실행 패키지 

# 기본 패키지 외에 설치된 패키지 사용( library Load )
library( rJava )  #library 순서는 이렇게 반드시 일치 시킬 것 
library( xlsx )

setwd( "C:\\workspace\\workspaceR" ) # 파일 저장 경로 설정 
df.xlsx <- read.xlsx( file = "airquality.xlsx",
                      sheetIndex = 1,
                      rncoding = "UTF-8" )
df.xlsx
class( df.xlsx )
str( df.xlsx )
head( df.xlsx )
tail( df.xlsx )

score <- c( 76, 85, 69, 98, 54, 76, 32, 48, 57,84 )
which( score == 69 )  # 조건에 만족하는 위치의 index
which( score >= 85 )
max( score )          # 최고값의 index
min( score )
which.min( score )    # 최저값의 index

idx <- which( score >= 60 )
score[ idx ] <- 61
score

idx <- which( df.xlsx[ , 1:2 ] == "NA", arr.ind = TRUE )
                     # arr.ind = TRUE : 해당 조건의 행/열값을 확인할때, [] : 대상 변수, "" : 조건
idx











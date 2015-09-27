# Codebook for coursera Getting and cleaning data project

I have used all the columns from the original data set.~ Therefore I have
563 columns in the end.~ The output file "CourseraProjectOutput.txt" in the
"outputdata" directory is
a tidy data set containing the following variables.~ The variable names
are extracted from the original dataset in the UCI_HAR_Dataset directory
from the "features.txt" file.

The activity ids are mapped as follows as described in the original data set.

## Activity

| id |              name |
|---:|:-----------------:|
|  1 |           WALKING|
|  2 |  WALKING_UPSTAIRS|
|  3 | WALKING_DOWNSTAIRS|
|  4|            SITTING|
|  5|           STANDING|
|  6|            LAYING|

## Some variables in the data set

```r
names(tidydata_foroutput)
```
```
[1] "SubjectID"                           
  [2] "Activity"                            
  [3] "tBodyAcc.mean...X"                   
  [4] "tBodyAcc.mean...Y"                   
  [5] "tBodyAcc.mean...Z"                   
  [6] "tBodyAcc.std...X"                    
  [7] "tBodyAcc.std...Y"                    
  [8] "tBodyAcc.std...Z"                    
  [9] "tBodyAcc.mad...X"                    
 [10] "tBodyAcc.mad...Y"                    
 [11] "tBodyAcc.mad...Z"                    
 [12] "tBodyAcc.max...X"                    
 [13] "tBodyAcc.max...Y"                    
 [14] "tBodyAcc.max...Z"                    
 [15] "tBodyAcc.min...X"                    
 [16] "tBodyAcc.min...Y"                    
 [17] "tBodyAcc.min...Z"                    
 [18] "tBodyAcc.sma.."                      
 [19] "tBodyAcc.energy...X"                 
 [20] "tBodyAcc.energy...Y"                 
 [21] "tBodyAcc.energy...Z"                 
 [22] "tBodyAcc.iqr...X"                    
 [23] "tBodyAcc.iqr...Y"                    
 [24] "tBodyAcc.iqr...Z"                 
```

## Summary of variables in the output file
``` r
str(tidydata_foroutput)
```


```
str(tidydata_foroutput)
'data.frame':	180 obs. of  563 variables:
 $ SubjectID                           : int  1 2 3 4 5 6 7 8 9 10 ...
 $ Activity                            : Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ tBodyAcc.mean...X                   : num  0.277 0.276 0.276 0.279 0.278 ...
 $ tBodyAcc.mean...Y                   : num  -0.0174 -0.0186 -0.0172 -0.0148 -0.0173 ...
 $ tBodyAcc.mean...Z                   : num  -0.111 -0.106 -0.113 -0.111 -0.108 ...
 $ tBodyAcc.std...X                    : num  -0.284 -0.424 -0.36 -0.441 -0.294 ...
 $ tBodyAcc.std...Y                    : num  0.1145 -0.0781 -0.0699 -0.0788 0.0767 ...
 $ tBodyAcc.std...Z                    : num  -0.26 -0.425 -0.387 -0.586 -0.457 ...
 $ tBodyAcc.mad...X                    : num  -0.341 -0.461 -0.409 -0.463 -0.324 ...
 $ tBodyAcc.mad...Y                    : num  0.0618 -0.1202 -0.0874 -0.0882 0.0213 ...
 $ tBodyAcc.mad...Z                    : num  -0.25 -0.41 -0.392 -0.578 -0.418 ...
 $ tBodyAcc.max...X                    : num  -0.103 -0.269 -0.055 -0.274 -0.144 ...
 $ tBodyAcc.max...Y                    : num  -0.05573 -0.114028 -0.099347 0.000394 0.07367 ...
 $ tBodyAcc.max...Z                    : num  -0.255 -0.376 -0.487 -0.508 -0.499 ...
 $ tBodyAcc.min...X                    : num  0.12 0.349 0.318 0.385 0.218 ...
 $ tBodyAcc.min...Y                    : num  -0.0212 0.0516 0.0225 0.1894 0.0634 ...
 $ tBodyAcc.min...Z                    : num  0.437 0.528 0.37 0.643 0.541 ...
 $ tBodyAcc.sma..                      : num  -0.126 -0.289 -0.245 -0.329 -0.175 ...
 $ tBodyAcc.energy...X                 : num  -0.739 -0.831 -0.79 -0.841 -0.739 ...
```



``` r
sum_tidy<-summary(tidydata_foroutput);
```


```
"1st Qu.:-0.9997  "             "1st Qu.:-0.9994  "            
 "Median :-0.9946  "             "Median :-0.9899  "            
 fBodyGyro.bandsEnergy...1.24.1 fBodyGyro.bandsEnergy...25.48.1
 "Min.   :-1.0000  "            "Min.   :-1.0000  "            
 "1st Qu.:-0.9984  "            "1st Qu.:-0.9997  "            
 "Median :-0.9695  "            "Median :-0.9947  "            
 fBodyGyro.bandsEnergy...1.8.2 fBodyGyro.bandsEnergy...9.16.2
 "Min.   :-0.9997  "           "Min.   :-0.99993  "          
 "1st Qu.:-0.9983  "           "1st Qu.:-0.99952  "          
 "Median :-0.9751  "           "Median :-0.98387  "          
 fBodyGyro.bandsEnergy...17.24.2 fBodyGyro.bandsEnergy...25.32.2
 "Min.   :-0.99993  "            "Min.   :-1.0000  "            
 "1st Qu.:-0.99962  "            "1st Qu.:-0.9997  "            
 "Median :-0.98784  "            "Median :-0.9948  "            
 fBodyGyro.bandsEnergy...33.40.2 fBodyGyro.bandsEnergy...41.48.2
 "Min.   :-0.9999  "             "Min.   :-0.9999  "            
 "1st Qu.:-0.9996  "             "1st Qu.:-0.9992  "            
 "Median :-0.9950  "             "Median :-0.9926  "            
 fBodyGyro.bandsEnergy...49.56.2 fBodyGyro.bandsEnergy...57.64.2
 "Min.   :-0.9998  "             "Min.   :-0.9999  "            
 "1st Qu.:-0.9985  "             "1st Qu.:-0.9988  "            
 "Median :-0.9873  "             "Median :-0.9905  "     
```

## Output files and directories

The output is written to the file "CourseraProjectOutput.txt" 
using write.table(tidydata_foroutput,"./outputdata/CourseraProjectOutput.txt",row.names=FALSE)

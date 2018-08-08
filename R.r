
# determine which directory your R session is using as its working directory
getwd()
# set working directory
setwd()
setwd("C:/Users/nanli/Desktop")
# list all object names in your local workspace
ls()
# list all object names and values
ls.str()
# list all the files in your working directory
list.files()
dir() 

list.files(path = ".", pattern = NULL, all.files = FALSE, full.names = FALSE, recursive = FALSE, ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)
dir(path = ".", pattern = NULL, all.files = FALSE, full.names = FALSE, recursive = FALSE, ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)

# used on function name to determine which arguments function takes
args(list.files)
# create directory
dir.create()
dir.create(file.path("testdir2", "testdir3"),recursive = TRUE)
# create file
file.create()
# check whether file exists
file.exists()
# access information about the file
file.info()
# file.rename(“mytest.R”, “mytest2.R”)
file.rename(from, to)
# copy
file.copy()
# provide the relative path to the file
file.path()
# to delete directory
unlink()
unlink("testdir2", recursive=TRUE)


# formatC
# sprintf





############################################ Data Manipulation ############################################


# 1 Data in R      

   # 1.1 Modes and Classes

      # Every object in R contains a number of attributies to describe the nature of the informaiton in that object. 
      # Two of the most important attributes of data in R are: class and mode
      # mode:  numeric, character, logical, factor, date, time, list 
      typeof()
      # class
        > mylist = list(a=c(1,2,3),b=c("cat","dog","duck"),d=factor("a","b","a"))
        > sapply(mylist,mode)
                  a           b           d 
          "numeric" "character"   "numeric" 
        > sapply(mylist,class)
                  a           b           d 
          "numeric" "character"    "factor" 
      # Values stored as factors require less storage than regular values, because R need only store each unique level one

  # 1.2 Data Storage in R

    # vector [c function] 
      # simplest way to store more than one value
      # eventially same objects mode
      > mode(c(1,2,5,10))
      [1] "numeric"
      # if any of the elements are chracter, the other elements will be converted to characters
      > mode(c(1,2,"cat",3))
      [1] "character"
      # logical elements combined with numeric elements will be converted to numeric equivalents with TRUE becoming 1 and FALSE becoming 0
      > mode(c(5,TRUE,3,7))
      [1] "numeric"

      # c function can also be used to combine vectors
      > all = c(c(1,2,5,10), c(1,2,"cat",3), c(5,TRUE,3,7))

      # Names can be given when the vector is first created
      > x = c(one=1,two=2,three=3)
      # or they can be added or changed after the fact using the names assignment function
      > x = c(1,2,3)
      > names(x) = c('one','two','three')
      # it can be indexed to modify only selected elements of names
      names(x)[1:2] = c('uno','dos')

      # if two vectors in volved in an operation are not of the same length, R will recycle the values of the shorter vector in order to make the lengths compatible.
      # repeat the scalar value to correspond to each value of the vector
      > nums = 1:10
      > nums
       [1]  1  2  3  4  5  6  7  8  9 10
      > nums + 1
       [1]  2  3  4  5  6  7  8  9 10 11
      > nums + c(1,2)
       [1]  2  4  4  6  6  8  8 10 10 12
      > nums + c(1,2,3)
       [1]  2  4  6  5  7  9  8 10 12 11
      Warning message:
      In nums + c(1, 2, 3) :
        longer object length is not a multiple of shorter object length

    # array 
      # multidimensional extension of vectors. Like vectors, all of the objects of an array must be of the same mode
      # matrice
        # 2-dimensional array
        # convert a vetor to a matrix
          # if only one of htese arguments is given, the other will be calculated based on the length of the input data
          # byrow: read in by rows
          matrix(nrow=,ncol=,byrow=TRUE)
        # matrices have an attribute called dim which is a vetor 
        dim()
          # dim() = c(nrow(),ncol())

        # names can be assigned to rows and columns of matrices through matrix function
        # dimnames must be a list, the first element is a vector of names for the rows and the second is a vector of names for the columns
        > rmat = matrix(rnorm(15),5,3,dimnames=list(NULL,c('A','B','C')))
        > rmat
                       A          B          C
        [1,] -1.20151651 -1.7796390  0.6276187
        [2,] -1.07376242  0.9743346 -0.4239424
        [3,]  1.40841810  0.9945637  1.7258191
        [4,] -0.48547539  1.3164168 -0.6633317
        [5,] -0.07168953  0.9857327 -1.0542735

        > rmat = matrix(rnorm(15),5,3,dimnames=list(c('a','b','c','d','e'),c('A','B','C')))
        > rmat
                    A          B          C
        a  0.79260004  0.4776550 -0.7403192
        b -0.02218071 -1.5277285 -1.4340921
        c  0.60476045  0.7411374  2.2223594
        d -0.11893920 -1.1883653  1.0682246
        e -3.10692302  1.0989483 -1.5038244
        # or after 
        > dimnames(rmat) = list(NULL,c('D','E','F'))
        dimnames
        row.names

    # list
      # store a variety of objects of possibly varing modes in a single R object
      > mylist = list(c(1,4,6),"dog",3,"cat",TRUE,c(9,10,11))
      > sapply(mylist,mode)
      [1] "numeric"   "character" "numeric"   "character" "logical"   "numeric"  
      # named
        > mylist = list(first=c(1,4,6),second=c(9,10,11),third='end')
        # or
        > names(mylist)=c('forth','fifth','sixth')

    # dataframe
      # since matrix would force to have the same mode, we use dataframe for data analysis
      # a list with the restriction that each element of the list must be of the same length as every orther element of the list
      # the mode of a data frame is list and its class is data.frame

  # 1.3 Testing for Modes and Classes
    is.list()
    is.factor()
    is.numeric()
    is.data.frame()
    is.character()
    is.matrix()

  # 1.4 Structure of R Objects
    # for all objects
    > ls.str()

    # summary()
    # summary function will provide the names, lengths, classes, and modes of the elements of the list
      > mylist = list(a=c(1,2,3),b=c("cat","dog","duck"),d=factor("a","b","a"))
      > summary(mylist)
        Length Class  Mode     
      a 3      -none- numeric  
      b 3      -none- character
      d 1      factor numeric  

    # str function tries to provide a workable compromise
    # more detailed
    > str(nestlist)

  # 1.5 Conversion of Objects
    > nums = c(1,2,1,2,5,2,1,5,2)
    > tt = table(nums)
    > tt
    nums
    1 2 5 
    3 4 2 
    > names(tt)
    [1] "1" "2" "5"
    > sum(as.numeric(names(tt))*tt)
    [1] 21

    > x = c(1,2,3,4,5)
    # the list function creates a list
    > list(x)
    [[1]]
    [1] 1 2 3 4 5
    # as.list converts the vector into a list of the same length as the vector
    > as.list(x)
    [[1]]
    [1] 1

    [[2]]
    [1] 2

    [[3]]
    [1] 3

    [[4]]
    [1] 4

    [[5]]
    [1] 5

  # 1.6 Missing Values
    # NA, without quotes represents a missing value. you can assgin a variable a value of NA
    NA
    # but to test for missing value you must use the:
    is.na 
    # x/0 may display as 
    Inf
    NaN
    # is.nan function can be used to distinguish this type of missing value from the ordinary NA value
    is.nan 

  # 1.7 Working with Missing Values
    # Most of the statistical summay functions (mean, var, sum, min, max, etc.) accept an argument called na.rm
    # which can be set to TRUE if you want missing values to be removed before the summary is calculated
    na.rm
    # create a vector which contains only the nonmissing values in x
    > x = c(NA,1,2,3,4)
    > x[!is.na(x)]
    [1] 1 2 3 4

    # the statistical modeling functions (lm, glm, gam, etc.) all have an argument called na.action
    # which allows you to specify a function that will be applied to the data frame specified by data=argument before the modeling function processes the data
    na.action
    # return a data frame with any row containing one or moremissing values eliminated
    na.omit
    complete.cases

    # normally missing values are not included when a variable is made into a factor
    # if you want the missing values to be considered a valid factor level, use: when the factor is first created
    exclude=NULL
    
    # when importing data from outside sources, missing values may be represented by some string other than NA. use:
    na.strings # in read.table can be passed a vector of charactre values that should be trated as missing values

##############################
# 2 Reading and Writing Data #
##############################

  # 2.1 Reading Vectors and Matrices [scan]

    # c function for small data, scan for large data
    # scan is most appropriate when all the data to be read is of the same mode, so that it can be accommodated by a vector or matrix

    # first argument to scan can be a quoted string or character variable containing the name of a file or a URL
    # if no first argument is given, scan will read from the console

    # by default, scan expects all of its input to be numeric data
    # this can be overridden with the what= argument which specifies the type of data that scan will see
      > names = scan(what="")
      1: joe fred bob John                   # user input
      5: same sue robin haha
      9: 
      Read 8 items
      > names
      [1] "joe"   "fred"  "bob"   "John"  "same"  "sue"   "robin" "haha" 

      > names = scan(what=list(a=0,b="",c=0))
      1: 1 dog 3
      2: 2 cat 5 3 duck 7
      4: 
      Read 3 records
      > names
      $a
      [1] 1 2 3

      $b
      [1] "dog"  "cat"  "duck"

      $c
      [1] 3 5 7

    # When the argument to what= is a list, 
    # the multi.line option can be set to FALSE to prevent scan from trying to use multiple lines to read the records for an observation
    multi.line = FALSE

    # read in data matrices
    # since scan returns a vector, a call to scan can be embedded inside a call to the matrix function
    # byrow=TRUE allows the vector to be converted to a matrix in the way that such data is usualy presented
      > mymat = matrix(scan(),ncol=3,byrow=TRUE)
      1: 1 2 3
      4: 4 5 6
      7: 7 8 9
      10: 
      Read 9 items
      > mymat
           [,1] [,2] [,3]
      [1,]    1    2    3
      [2,]    4    5    6
      [3,]    7    8    9

    # In order to skip fields while reading in data with scan,
    # a type of NULL can be used in the list passed to the what= argument
    # e.g we only need to read the contents of the first, third and tenth fields
    values = scan(filename,what=c(f1=0,NULL,f3=0,rep(list(NULL),6),f10=0))
    # once the file is read in this way, a matrix with the extracted fields could be constructed with the cbind funcion
    result = cbind(values$f1,values$f3,values$f10)

  # 2.2 Data Frames [read.table]
    # return a data frame
    # single mode => scan
    # mixed modes => read.table

    # alternative seperater : sep= 
    # fixed columns         : read.fwf

    # header=TRUE
    # or use col.names to specify a character vector conaining the variable names
    # by default, all the columns will be names using a V1, V2...

    # read.table automatically converts character vars to factors
    # you can prevent conversion to factors by using stringsAsFactors=FALSE

    as.is
    # as.is= argument can be sued to suppress factor conversion for a subset of the vars in you data
    row.names
    # row.names= argument can be used to pass a vector of char values to be used as row names

    # read.table will automatically treat the symbol NA as representing amissing value for any data type, and NaN, Inf and -Inf as missing for numeric data
    P25    .................................................................................

  # 2.3 Comma- and Tab-Delimited Input Files
    # These functions are wrappers for read.table with appropriate arguments set for comma-, semicolon- or tab-delimited data
    read.csv
    read.csv2
    read.delim
 
  # 2.4 Fixed Width Input Files [read.fwf]
    # the widths= argument can be a vector containing the widths of the filds to be read, 
    # using negative numbers to indicate columns to be skipped

    > city = read.fwf("city.txt",widths=c(18,-19,8),as.is=FALSE) # don't need the 19th column
    > city$V2 = as.numeric(gsub(',','',city$V2))

  # 2.5 Extracting Data from R Objects
    .......................................................................................

  # 2.6 Connections
    # Functions: file, pipe, textConnection, gzfile, unz, gzfile, url, socketConnection

    > rpage = url('http://www.r-project.org/main.shtml','r')
    .......................................................................................

  # 2.7 Reading Large Data Files [sample]
    # Since readLines and Scan don't need to read an entire file into memory,
    # there're situations where very large files can be processed by R in pieces
    # e.g. suppose we have a large file containing numeric variables 
    # and we wish to read a random sample of that file into R

    # select a random sample of rows before reading the data
    .......................................................................................

  # 2.8 Generating Data

    # 2.8.1 Sequences [seq, gl]
      # seq
        # integers between two values
          > 1:10
          [1]  1  2  3  4  5  6  7  8  9 10
        # seq(start,end,by)
          > seq(1,10)
           [1]  1  2  3  4  5  6  7  8  9 10
          > seq(1,10,5)
          [1] 1 6
        # seq(start,by,length)
          > seq(1,by=10,length=5)
          [1]  1 11 21 31 41

      # gl
        # two required arguments
        # 1st: number of different levels desired
        # 2nd: number of times each level needs to be repeated
        # option 3rd: length
        # lables=
        # ordered=TRUE argument to produce ordered factors
        > thelevels = data.frame(group=gl(3,5))
        > thelevels
           group
        1      1
        2      1
        3      1
        4      1
        5      1
        6      2
        7      2
        8      2
        9      2
        10     2
        11     3
        12     3
        13     3
        14     3
        15     3
        > thelevels = data.frame(group=gl(3,5,length=4))
        > thelevels
          group
        1     1
        2     1
        3     1
        4     1

      # expand.grid
        # create unique combination defined by a collection of sequences
        # accepts any number of sequences and returns a data frame with one row for each unique combination of the values passed as input
        > oe = expand.grid(odd = seq(1,5,by=2),even=seq(2,5,by=2))
        > oe
          odd even
        1   1    2
        2   3    2
        3   5    2
        4   1    4
        5   3    4
        6   5    4
        > seq(1,5,by=2)
        [1] 1 3 5
        > even=seq(2,5,by=2)
        > seq(2,5,by=2)
        [1] 2 4

        # can used to evaluate a function over a range of parameter values
        > input = expand.grid(x=0:10,y=0:10)
        > res = apply(input,1,function(row)row[1]^2+row[2]^2)
        > head(cbind(input,res))
          x y res
        1 0 0   0
        2 1 0   1
        3 2 0   4
        4 3 0   9
        5 4 0  16
        6 5 0  25

    # 2.8.2 Random Numbers
      # Function  Distribution
      # rbeta     Beta
      # rbinom    Binomial
      # rcauchy   Cauchy
      # rchisq    Chi-square
      # rexp      Exponential
      # rf        F
      # rgamma    Gamma
      # rgeom     Geometric
      # rhyper    Hypergeometirc
      # rlnorm    Log Normal
      # rlogis    logistic
      # rmultinom Multinomial
      # rnbinom   Negative Binomial
      # rnorm     Normal
      # rpois     Poisson
      # rsignrank Signed Rank
      # rt        Student's t
      # runif     Uniform
      # rweifull  Weibull
      # rwilcox   Wilcoxon Rank Sum
      .Random.seed 
      # to create a reproducible sequence, an integer can be passed to the set.seed function
      set.seed

  # 2.9 Permutations
    # 2.9.1 Random Permutations
    P39 .......................................................







  # 2.11 Spreadsheets
    # 2.11.1 The RODBC Package on Windows [ODBConnectExcel]
      
      # FIRST STEP: CONNECT TO EXCEL
      > library(RODBC)
      > sheet = 'c:\\Desktop\\sheet.xls'
      > con = odbcConnectExcel(sheet)
      # SECOND STEP: FIND NAMES OF THE AVAILABLE SHEETS
      > tbls = sqlTables(con)
      # THIRD STEP: EXAMINING tbls$TABLE_NAME, SHEET => DATA FRAME
      qry = paste("SELECT * FROM", tbls$TABLE_NAME[1],sep=' ')
      result = sqlQuery(con,qry)
      # if the table name contains special character, then it needs to be surrounded by backquotes (')
      qry = paste("SELECT * FROM '", tbls$TABLE_NAME[1], "'", sep=' ')

    # 2.11.2 The gdata Package (All Platforms) [read.xls]
      # gdata package

  # 2.12 Saving and Loading R Data Objects
    # if you'd like to save your workspace image at some other time during your R session: 
    save.image
    # remove unwanted objects
    rm
    # e.g. to save the R objects x,y and z to a file called mydata.rda:
    > save(x,y,z,file='mydata.rda')
    # if the names of the objects to be saved are stored as character vectors:
    > save(list=c('x','y','z'),file='mydata.rda')

    # once the data is saved, it can be reloaded into a running R session with the load command
    > load('mydata,rda')

  # 2.13 Working with Binary Files
    P45 ...........................................................

  # 2.14 Writing R Objects to Files in ASCII Format
    # scan()     => write()
    # read.table => write.table()

    # 2.14.1 The write Function
      # build up an output file incrementally:
      append=TRUE

      # specify the number of values to write on each line
      ncolumns=
      # matrices are internally stored by columns and will be written to any output connection in that order
      # two write a matrix in row-wise order, use its transpose and adjust the ncolumn=
      # e.g. to write the values in the state.x77 matrix to file in row-wise order:
        > write(t(state.x77),file='state.txt',ncolumns=ncol(state.x77))

    # 2.14.2 The write.table function
      # by default, character strings are surrounded by quoted by write.table, use the quote=FALSE argument to suppress this feature
      # to suppress row names or column names from being written to the file, use the row.names=FALSE or col.names=FALSE
      > write.table(CO2,file='co2.txt',row.names=FALSE,sep=',')

      # Similarly to read.csv and read.csv2 the function
      write.csv
      write.csv2
      write.fwf

  # 2.15 Reading Data from Other Programs
    # Functions in foreign package
    # read data.dump output or saved objects from S version 3 may work with older Splus objects
    data.restore
    read.S
    # read or write the saved objects from DBF files
    read.dbf
    # read saved objects from Stata
    read.dta 
    write.dta 
    # epinfo
    rad.epinfo 
    # SPSS
    read.spss 
    # Minitab Portable Worksheet files
    read.mtp 
    # GNU octave
    read.octave 
    # read saved objects in SAS export format
    read.xport 
    # read saved objects from systat rectangular (mtype=1) data only
    read.systat
    P49 ...........................................................

##############################
# 3 R and databases          #
##############################
# Two principal ways to connect with databses in R
# - ODBC 
# - DBI package
#   provides a uniform, clientside interface to different database management systems, such as MySQL, PostgreSQL, and Oracle

  # 3.1 A Brief Guide to SQL
  # 3.2 ODBC
  # 3.3 Using the RODBC Package
  # 3.4 The DBI Package
  # 3.5 Accessing a MySQL Database
    > library(RMySQL)
    > drv = dbDriver("MySQL")

    ############################################ Connecting to PostgreSQL ############################################

    #----------------------- FIRST STEP -----------------------#
    # install.packages("RPostgreSQL")
    # library('RPostgreSQL')
    require("RPostgreSQL")

    #----------------------- SECOND STEP -----------------------#
    # Connection Credentials
    host = 'mastros-prd.cxj89kwq46vz.us-west-2.rds.amazonaws.com'
    dbname = 'mastros'
    port = 5432
    password = 'm@sTr0s!'
    username = 'mastros'

    # Load a driver for a PostgreSQL-type database and make a connection to the database management server of interest
    # This connection stays alive for as long as you want it
    con <- dbConnect(RPostgreSQL::PostgreSQL(), 
                    dbname=dbname, 
                    host=host,
                    port=port, 
                    password=password, 
                    user=username)
    # OR
    drv = dbDriver("PostgreSQL")
    con = dbConnect(drv, 
                    dbname=dbname, 
                    host=host,
                    port=port, 
                    password=password, 
                    user=username)

    #----------------------- LAST STEP -----------------------#
    # When finished, we free up resources by disconnecting and unloading the driver:
    dbDisconnect(con)
    dbUnloadDriver(drv)

  #3.6 Performing Queries
    #----------------------- THIRD STEP -----------------------#
    # Once the connection is established, queries can be sent to the database.

    # dbListTables
      # Returns the names of the tables in the dbname database 
      # SQL: SHOW TABLES
      dbListTables(con)

    # dbListResults
      # Gives a list of all currently active result set objects for the connection con
      dbListResults(con)

    # dbReadTable
      # Imports the ot_staging table from the database into R as a data frame, using the attribute PlayerID as the row.names for the data frame.
      # SQL: SELECT
      # read back the full table: method 1
      dtable = dbReadTable(con, "ot_staging")
      dtable = dbReadTable(con, "ot_staging", row.names = "PlayerID")

    # dbGetQuery
      # read back the full table: method 2
      # send a query to the database and have the resulting table returned as a data frame
      dtable = dbGetQuery(con, "select * from ot_staging")
      # perform a simple aggregate query, there is no need to pull a database table into R and apply an R function to the data frame
      dtable = dbGetQuery(con, "SELECT count(*) FROM ot_staging")

    # dbSendQuery
      # read back the full table: method 3
      # in the case where data needs to be processed in pieces (when the result table is huge),
      # the dbSendQuery function can be used to initiate the query,
      # and the fetch function can be passed the rsult from dbSendQuery to sequentially access the results of the query.
      rs = dbSendQuery(con, "SELECT * FROM ot_staging;")
      # rs <- dbSendQuery(con, statement="SELECT * FROM ot_staging")
      # Once all the required data is extracted using fatch,
      # the result from dbSendQuery should be passed to the dbClearResult function to insure that the next query will be properly processed.
      dbClearResult(rs)
      # by default fetch will return 500 records at a time
      # n = −1 assignment for the parameter specifies that all remaining tuples are to fetched. 
      # The fetch function converts each attribute in the result set to the corresponding type in R. 
      > summary(rs)
      <PostgreSQLResult:(47676,0,2)> 
        Statement: SELECT * FROM ot_staging; 
        Has completed? no 
        Affected rows: -1 
        Rows fetched: 0 
      > firstBatch = fetch(rs, n = 12)
      > summary(rs)
      <PostgreSQLResult:(47676,0,2)> 
        Statement: SELECT * FROM ot_staging; 
        Has completed? no 
        Affected rows: -1 
        Rows fetched: 12 
      > dbHasCompleted(rs)
      [1] FALSE
      # Provides a status of the number of rows that have been fetched in the query
      > dbGetRowCount(rs)
      [1] 12
      > lastBatch = fetch(rs, n = -1)
      > summary(rs)
      <PostgreSQLResult:(47676,0,2)> 
        Statement: SELECT * FROM ot_staging; 
        Has completed? yes 
        Affected rows: -1 
        Rows fetched: 82 
      > dbHasCompleted(rs)
      [1] TRUE
      > dbGetRowCount(rs)
      [1] 82
      > dbClearResult(rs)
      [1] TRUE
      > summary(rs)
      <Expired PostgreSQLResult:(47676,0,2)> 
      NULL

      # remove table from database
      dbSendQuery(con, "drop table ot_staging")

      # commit the change
      dbCommit(con)

  #3.7 Normalized Tables
    result = data.frame(name=parts$name,
                        price=parts$price,
                        supplier=factor(parts$supplierid,
                                        levels=suppliers$supplierid
                                        labels=suppliers$name))
    # Since the data.frame function automatically converts character variables to factors,
    # both name and supplier will be stored as factors

  # 3.8 Getting Data into MySQL

    # dbWriteTable
      # write the table into the database.
      # use row.names=FALSE to prevent the query from adding the column 'row.names' to the table in the db
      # by using the append=TRUE argument, a large database table can be built using smaller pieces
      dbWriteTable(con,'ot_staging',ot_staging, row.names=FALSE)
      # The function dbWriteTable() returns TRUE if the table was successfully written. 
      # Note this call will fail if iris already exists in the database. 
      # Use overwrite=TRUE to force overwriting of an existing table, and append=TRUE to append to an existing table.

    # dbBuildTableDefinition
      # create a table directly from raw data
      > x = data.frame(name='',number=0.)
      > x
        name number
      1           0
      > cat(dbBuildTableDefinition(dbDriver("PostgreSQL"),'mydata',x),"\n")
      +
      CREATE TABLE mydata
      ( row_names text,
        name      text,
        number    double
      )

      > dbGetQuery(con, "LOAD DATA INFILE 'mydata.txt'\
                   INTO TABLE mydata\ FIELDS TERMINATED BY ','")

    # dbExistsTable, and dbRemoveTable, which are equivalent to the R functions ’exists’, and ’remove’, respectively.

    ############################################ Connecting to PostgreSQL ############################################

  # 3.9 More Complex Aggregations

    # dbApply
    # mydbapply
    # groupv

########################
# 4 Dates              #
########################
  
  # for date only data, as.Date will usually be the best choice
  # if you need to handle dates and times, without time-zone information, the chron package is a good choice
  # the POSIX classes especially useful when time-zone manipulation is important

  # 4.1 as.Date
    > as.Date('2017-03-17')
    > as.Date('2017/03/17')

    # Format
    # %d Day of the month
    # %m month(number)
    # %b Month(abbreviated)
    # %B month(full name)
    # %y Year(2 digit)
    # %Y Year(4 digit)
    > as.Date('1/15/2001',format='%m/%d/%Y')
    [1] "2001-01-15"
    > as.Date('April 26,2001',format='%B %d,%Y')
    [1] "2001-04-26"
    > as.Date('22JUN01',format='%d%b%y')
    [1] "2001-06-22"

    P67 ..........................................................................

  # 4.2 The chron Package
    P67 ..........................................................................

  # 4.3 POSIX Classes
    P67 ..........................................................................

  # 4.4 Working with Dates
    > rdates = as.data.frame(matrix(rdates,ncol=2,byrow=TRUE))
    > rdates[,2]=as.Date(rdates[,2],format='%d%b%Y')
    > names(rdates) = c("Release","Date")

    > mean(rdates$Date)
    > range(rdates$Date)
    > rdates$Date[11] - rdates$Date[1]

  # 4.5 Time Intervals [difftime]

    > b1 = ISOdate(1997,7,13)
    > b2 = ISOdate(1997,7,15)
    > b2-b1
    Time difference of 2 days

    > difftime(b2,b1,units='weeks')
    Time difference of 0.2857143 weeks
    > difftime(b2,b1,units='days')
    Time difference of 2 days

    # conver time unit
      > ydiff = (b2-b1)/365.25
      > ydiff
      Time difference of 0.005475702 days
      > attr(ydiff,'units') = 'years'
      > ydiff
      Time difference of 0.005475702 years

  # 4.6 Time Sequences
    > seq(as.Date('1976-5-8'),by='days',length=5)
     [1] "1976-05-08" "1976-05-09" "1976-05-10" "1976-05-11" "1976-05-12" 
    # all the date classes except for chron will accept an integer before the interval provided as a by= argument
    > seq(as.Date('2017-3-1'),to=as.Date('2017-03-31'),by='2 weeks')
    [1] "2017-03-01" "2017-03-15" "2017-03-29"

    # cut function also understands units of days, weeks, months and years 
    # making it very easy to create factors grouped by these units

    format()
      # format codes can also be used to extract parts of dates as an alternative to the weekdays
      # we could look at the distribution of weekdays 
      > table(format(rdates$Date,'%A'))

      # convert dates to factor
      > fdate = factor(format(rdates$Date,'%Y'))

########################
# 5 Factors            #
########################
# limited number of different values -> categorical variables
# important use in statistical modeling

  # 5.1 Using Factors
    # stored as a vector of integer values with a corresponding set of character values
    # both numeric and chracter variables can be made into factors
    # but a factor's levels will always be chracter values
    # read.table will automatically convert character variables to factors unless then as.is=TRUE or stringsAsFactors=FALSE
    > data = c(1,2,1,2,1,2,1,3,1,2,3,2,1,2)
    > fdata=factor(data)
    > data
     [1] 1 2 1 2 1 2 1 3 1 2 3 2 1 2
    > fdata
     [1] 1 2 1 2 1 2 1 3 1 2 3 2 1 2
    Levels: 1 2 3

    # convert the default factor to roman numerals
    > levels(fdata) = c('I','II','III')
    > fdata
     [1] I   II  I   II  I   II  I   III I   II  III II  I   II 
    Levels: I II III

    # change level names when creating the factor
    > rdata=factor(data,labels=c('I','II','III'))
    > rdata
     [1] I   II  I   II  I   II  I   III I   II  III II  I   II 
    Levels: I II III

    # check levels
    > levels(fdata)
    # number of levels
    > nlevels(fdata)

    # limit display levels
    > factor(data,ordered=TRUE,levels=1)

    > mons = c("March","April","January","November","January","September","October",'November')
    > mons = factor(mons)
    > mons
    [1] March     April     January   November  January   September October   November 
    Levels: April January March November October September
    > table(mons)
    mons
        April   January     March  November   October September 
            1         2         1         2         1         1 
    > mons = factor(mons,levels=c("January","March","April","September","October","November",ordered=TRUE))

    # change display order
    > factor(data,ordered=TRUE)
     [1] 1 2 1 2 1 2 1 3 1 2 3 2 1 2
    Levels: 1 < 2 < 3

  # 5.2 Numeric Factors
  # 5.3 Manipulating Factors
  # 5.4 Creating Factors from Continuous Vairables
  # 5.5 Factors Based on Dates and Times
  # 5.6 Interactions








########################
# 6 Subscripting       #
########################

############################
# 7 Character Manipulation #
############################

########################
# 8 Data Aggregation   #
########################

########################
# 9 Reshaping Data     #
########################

























# Extra: RPostgreSQL and sqldf

# If you are accustomed to manipulating data with SQL, 
# you may prefer SQL notation to the sometimes convoluted calling conventions of the analogous R operations like aggregate(), or the functions in the dplyr package. 
# In this case you have probably already discovered the sqldf package, which allows you to manipulate data frames using SQL. 
# If you are a sqldf user, there is an additional subtlety if you are also using RPostgreSQL or other R packages for talking to databases: sqldf uses its own internal (and ephemeral) database to perform its operations, but if RPostgreSQL is loaded, sqldf will pick up your PostgreSQL driver by default. 
# This is probably not what you want.

options(gsubfn.engine = "R")
# install.packages("sqldf")
library(sqldf) 

# Now try to use sqldf to aggregate sepal_length by species
query = "select aloha_id, avg(q-1) avg_overall 
         from dtable 
         group by aloha_id"

> sqldf(query)
Error in postgresqlNewConnection(drv, ...) : 
  RS-DBI driver: (could not connect postgres@localhost on dbname "test"
)
Error in !dbPreExists : invalid argument type
> 

# To use sqldf on local data frames, you must specify the driver and dbname explicitly.
sqldf(query, drv="SQLite", dbname=":memory:") ---------------------------------------------------------?


# Extra: PostgreSQL and dplyr

# If you do use dplyr, the good news is that you can connect to a PostgreSQL database directly through the dplyr function src_postgres().
# install.packages("dplyr")
library('dplyr')

# Connect to local PostgreSQL via dplyr
localdb <- src_postgres(dbname = dbname,
                        host = host,
                        port = port,
                        user = username,
                        password = password)

# cheat and access the db connection directly
# assume we have made the colnames db safe
# dbWriteTable(localdb$con,'ot_staging',ot_staging, row.names=FALSE)
## [1] TRUE

# The tbl() command lets you access tables in the database remotely, and sql() lets you send queries.
# this is not a data frame; it's a dplyr PostgreSQL handle into the database
d = tbl(localdb, "ot_staging") 
d

# this is a data frame
dtab= as.data.frame(d)

# send a query through dplyr
query = "select aloha_id, avg(aloha_store) avg_overall 
         from ot_staging
         group by aloha_id"

dsub = tbl(localdb, sql(query))
dsub

# make it local
dsub = as.data.frame(dsub)
summary(dsub)

# shuts down database
rm(list=c('d','localdb')); gc() 








## Not run: 
conn <- dbConnect("MySQL", group = "vitalAnalysis")
con2 <- dbConnect("ODBC", "dsn", "user", "pwd")
if(dbExistsTable(con2, "fuel_frame")){
   fuel.frame <- dbReadTable(con2, "fuel_frame")
   dbRemoveTable(conn, "fuel_frame")
   dbWriteTable(conn, "fuel_frame", fuel.frame)
}
if(dbExistsTable(conn, "RESULTS")){
   dbWriteTable(conn, "RESULTS", results2000, append = T)
else
   dbWriteTable(conn, "RESULTS", results2000)
}
## End(Not run)












# Note:
# find variance
select var_samp(), 
# find standard deviation
stddev_samp()

CRAN
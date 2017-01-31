library(openxlsx)
Y1HCL02122014<-readWorkbook("/Volumes/Cheral/Official/CMCHIS/CMCHIS Dump/1H to 5H Raw Data_29.04.2016/Raw/1H_CLAIMS RAW DATA_02.12.2014.xlsx",
             sheet = 1, startRow = 1, colNames = TRUE)
Y1HPA02122014<-readWorkbook("/Volumes/Cheral/Official/CMCHIS/CMCHIS Dump/1H to 5H Raw Data_29.04.2016/Raw/1H_PREAUTH RAW DATA_02.12.2014.xlsx",
             sheet = 1, startRow = 1, colNames = TRUE)
Y2HCL27052015<-readWorkbook("/Volumes/Cheral/Official/CMCHIS/CMCHIS Dump/1H to 5H Raw Data_29.04.2016/Raw/2H_CLAIMS RAW DATA_27.05.2015.xlsx",
             sheet = 1, startRow = 1, colNames = TRUE)
Y2HPA27052015<-readWorkbook("/Volumes/Cheral/Official/CMCHIS/CMCHIS Dump/1H to 5H Raw Data_29.04.2016/Raw/2H_PREAUTH RAW DATA_27.05.2015.xlsx",
             sheet = 1, startRow = 1, colNames = TRUE)
Y3HCL31032016<-readWorkbook("/Volumes/Cheral/Official/CMCHIS/CMCHIS Dump/1H to 5H Raw Data_29.04.2016/Raw/3H_CLAIMS RAW DATA_31.03.2016.xlsx",
             sheet = 1, startRow = 1, colNames = TRUE)
Y3HPA31032016<-readWorkbook("/Volumes/Cheral/Official/CMCHIS/CMCHIS Dump/1H to 5H Raw Data_29.04.2016/Raw/3H_PREAUTH RAW DATA_31.03.2016.xlsx",
             sheet = 1, startRow = 1, colNames = TRUE)

## save

rm(Y1HPA02122014,Y1HCL02122014,Y2HPA27052015,
   Y2HCL27052015,Y3HPA31032016,Y3HCL31032016)

Y45HCL29042016<-readWorkbook("/Volumes/Cheral/Official/CMCHIS/CMCHIS Dump/1H to 5H Raw Data_29.04.2016/Raw/4H & 5H_CLAIMS RAW DATA_29.04.2016.xlsx",
             sheet = 1, startRow = 1, colNames = TRUE)
Y45HPA29042016<-readWorkbook("/Volumes/CHeral/Official/CMCHIS/CMCHIS Dump/1H to 5H Raw Data_29.04.2016/Raw/4H & 5H_PREAUTH RAW DATA_29.04.2016.xlsx",
             sheet = 1, startRow = 1, colNames = TRUE)
YDC29042016<-readWorkbook("/Volumes/CHeral/Official/CMCHIS/CMCHIS Dump/1H to 5H Raw Data_29.04.2016/Raw/DC29 Apr 2016.xlsx",
             sheet = 1, startRow = 1, colNames = TRUE)

## save

rm(Y45HPA29042016,Y45HCL29042016,YDC29042016)

detach(package:openxlsx)

# making single df for 1H
load("/Volumes/CHeral/Official/CMCHIS/RStudio/CMCHIS/Y123HRaw.RData")

cl1h<-Y1HCL02122014
pa1h<-Y1HPA02122014

pa1h<-pa1h[, -c(7:11,13:17,20:27,29,32,
                36,38:39,41,43:67)]

detach(package:dplyr)
library(plyr)

pa1h<-rename(pa1h, c("Ref.No" = "ref_no",
                     "Patient.Name" = "pt_name",
                     "Gender" = "gender",
                     "Patient.Age" = "age",
                     "Payer.Zone" = "payer_zone",
                     "Hospital" = "hosp_name",
                     "Member.Caste/Category" = "caste",
                     "Admission.Date" = "adm_time",
                     "Discharged.Date" = "dis_time",
                     "First.Submission.Time" = "pa_1sub_time",
                     "Submission.Time" = "pa_sub_time",
                     "Authorized.Time" = "pa_time",
                     "Status" = "pa_status",
                     "Provisional.Diagnosis" = "diag",
                     "Package/Procedure.Name" = "pkg",
                     "Card.No" = "id_no",
                     "Patient.TPA.ID" = "urn_no",
                     "Relation.with.Primary.Insured/Main.Member" =
                       "relation"))

cl1h<-cl1h[, -c(2:33,36,38:42,44:51,54:58,60:70,72:73)]

cl1h<-rename(cl1h, c("Ref.No" = "ref_no",
                     "Submission.Time" = "cl_1sub_time",
                     "Authorized.Time" = "cl_time",
                     "STATUS" = "cl_status",
                     "Package/Procedure.Rate" = "pkg_rate",
                     "Preauth.Amt" = "pa_amt",
                     "Claims.Bill.Amt" = "bill_amt",
                     "Final.App.Amt" = "cl_amt",
                     "Implants.Used" = "implant"))

detach(package:plyr)
library(dplyr)

y1h<-full_join(pa1h,cl1h,by = "ref_no",copy = FALSE)

# making single df for 2H

cl2h<-Y2HCL27052015
pa2h<-Y2HPA27052015

pa2h<-pa2h[, -c(7:11,13:17,20:27,29,32,
                36,38:39,41,43:73)]

detach(package:dplyr)
library(plyr)

pa2h<-rename(pa2h, c("Ref.No" = "ref_no",
                     "Patient.Name" = "pt_name",
                     "Gender" = "gender",
                     "Patient.Age" = "age",
                     "Payer.Zone" = "payer_zone",
                     "Hospital" = "hosp_name",
                     "Member.Caste/Category" = "caste",
                     "Admission.Date" = "adm_time",
                     "Discharged.Date" = "dis_time",
                     "First.Submission.Time" = "pa_1sub_time",
                     "Submission.Time" = "pa_sub_time",
                     "Authorized.Time" = "pa_time",
                     "Status" = "pa_status",
                     "Provisional.Diagnosis" = "diag",
                     "Package/Procedure.Name" = "pkg",
                     "Card.No" = "id_no",
                     "Patient.TPA.ID" = "urn_no",
                     "Relation.with.Primary.Insured/Main.Member" =
                       "relation"))

cl2h<-cl2h[, -c(2:32,35,37:41,43:50,53:57,59:69,71:73)]

cl2h<-rename(cl2h, c("Ref.No" = "ref_no",
                     "Submission.Time" = "cl_1sub_time",
                     "Authorized.Time" = "cl_time",
                     "STATUS" = "cl_status",
                     "Package/Procedure.Rate" = "pkg_rate",
                     "Preauth.Amt" = "pa_amt",
                     "Claims.Bill.Amt" = "bill_amt",
                     "Final.App.Amt" = "cl_amt",
                     "Implants.Used" = "implant"))

detach(package:plyr)
library(dplyr)

y2h<-full_join(pa2h,cl2h,by = "ref_no",copy = FALSE)

# making single df for 3H
cl3h<-Y3HCL31032016
pa3h<-Y3HPA31032016

pa3h<-pa3h[, -c(2,9:13,15:19,22:29,31,34,
                38,40:41,43,45:77)]

cl3h<-cl3h[, -c(2:34,38,40:44,46:53,56:60,62:73,75:77)]

## rename func in plyr
detach(package:dplyr)
library(plyr)

pa3h<-rename(pa3h, c("Ref.No" = "ref_no",
                     "Patient.Name" = "pt_name",
                     "Gender" = "gender",
                     "Patient.Age" = "age",
                     "Payer.Zone" = "payer_zone",
                     "Hospital" = "hosp_name",
                     "Member.Caste/Category" = "caste",
                     "Admission.Date" = "adm_time",
                     "Discharged.Date" = "dis_time",
                     "First.Submission.Time" = "pa_1sub_time",
                     "Submission.Time" = "pa_sub_time",
                     "Authorized.Time" = "pa_time",
                     "Status" = "pa_status",
                     "Provisional.Diagnosis" = "diag",
                     "Package/Procedure.Name" = "pkg",
                     "Card.No" = "id_no",
                     "Patient.TPA.ID" = "urn_no",
                     "Relation.with.Primary.Insured/Main.Member" =
                       "relation",
                     "Hospital.Code" = "hosp_code"))

cl3h<-rename(cl3h, c("Ref.No" = "ref_no",
                     "First.Submission.Time" = "cl_1sub_time",
                     "Submission.Time" = "cl_sub_time",
                     "Authorized.Time" = "cl_time",
                     "STATUS" = "cl_status",
                     "Package/Procedure.Rate" = "pkg_rate",
                     "Preauth.Amt" = "pa_amt",
                     "Claims.Bill.Amt" = "bill_amt",
                     "Final.App.Amt" = "cl_amt",
                     "Implants.Used" = "implant"))

## merge pa & cl using dplyr
detach(package:plyr)
library(dplyr)

y3h<-full_join(pa3h,cl3h,by = "ref_no",copy = FALSE)

detach(package:dplyr)
library(plyr)

yh12<-rbind.fill(y1h,y2h)

# Making master for hosp code 123H
load("/Volumes/CHeral/Official/CMCHIS/RStudio/Master/Master.RData")

#  yh12<-left_join(yh12,hosp_master,by = c("hosp_name"="hospname"),
#            copy = FALSE)

#  table(is.na(yh12$hosptype))

## extract and edit with editor
# hospital<-yh12%>%
#  group_by(hosp_name, hospcode)%>%
#  summarise(count = n())

# hospital<-edit(hospital)

## load the edited master and rename the columns
load("/Volumes/Cheral/Official/CMCHIS/RStudio/Dummy/dummy.RData")

p<-rename(p,c("hospcode" = "hosp_code",
              "hospname" = "hosp_name",
              "hosploc" = "hosp_zone",
              "hosptype" = "hosp_type",
              "dis_code" = "hosp_zone_code"))

detach(package:plyr)
library(dplyr)

yh12<-left_join(yh12, p, by = c("hosp_name" = "hosp"), copy = FALSE)
yh12<-mutate(yh12, cl_sub_time = NA)

table(is.na(yh12$hosp_type))

yh12<-yh12[,c(1:5,27,6,30,29,31,7:19,32,20:26)]

yh3<-left_join(y3h, p, by = c("hosp_name" = "hosp"), copy = FALSE)

yh3<-yh3[,c(1:7,32,31,33,8:28)]

detach(package:dplyr)
library(plyr)

yh3<-rename(yh3,c("hosp_code.x" = "hosp_code"))

yh<-rbind(yh12,yh3)

yh[46324,"payer_zone"][yh[46324,"payer_zone"] == "Select Payer Zone"]<-"NAMAKKAL"

## clean dates

yh$adm_time <- as.Date(yh$adm_time, origin = "1900-01-01")
yh$dis_time <- as.Date(yh$dis_time, origin = "1900-01-01")
yh$pa_sub_time <- as.Date(yh$pa_sub_time, origin = "1900-01-01")
yh$pa_time <- as.Date(yh$pa_time, origin = "1900-01-01")
yh$pa_1sub_time <- as.Date(yh$pa_1sub_time, origin = "1900-01-01")
yh$cl_sub_time <- as.Date(yh$cl_sub_time, origin = "1900-01-01")
yh$cl_time <- as.Date(yh$cl_time, origin = "1900-01-01")
yh$cl_1sub_time <- as.Date(yh$cl_1sub_time, origin = "1900-01-01")

yh$adm_time<-as.factor(yh$adm_time)
yh$dis_time<-as.factor(yh$dis_time)
yh$pa_1sub_time<-as.factor(yh$pa_1sub_time)
yh$pa_sub_time<-as.factor(yh$pa_sub_time)
yh$pa_time<-as.factor(yh$pa_time)
yh$cl_1sub_time<-as.factor(yh$cl_1sub_time)
yh$cl_sub_time<-as.factor(yh$cl_sub_time)
yh$cl_time<-as.factor(yh$cl_time)

rm(Y1HPA02122014,Y1HCL02122014,Y2HPA27052015,
   Y2HCL27052015,Y3HPA31032016,Y3HCL31032016,cen2011,cl1h,
   cl2h,cl3h,dis_master,tpa_master,pkg_master,hosp_master,hospital1,p,pa1h,pa2h,pa3h)

## save

rm(y1h,y2h,y3h,yh12,yh3,yh)

# making single df for 45H
load("/Volumes/Cheral/Official/CMCHIS/RStudio/CMCHIS/Y45HDCRaw29042016.RData")

pa45h<-Y45HPA29042016
cl45h<-Y45HCL29042016

pa45h<-pa45h[, -c(8:12,14:18,21:28,30,33,37,39:40,42,44:70)]

pa45h<-rename(pa45h, c("Ref.No" = "ref_no",
                     "Patient.Name" = "pt_name",
                     "Gender" = "gender",
                     "Patient.Age" = "age",
                     "Payer.Zone" = "payer_zone",
                     "Hospital" = "hosp_name",
                     "Hospital.Code" = "hosp_code",
                     "Member.Caste/Category" = "caste",
                     "Admission.Date" = "adm_time",
                     "Discharged.Date" = "dis_time",
                     "First.Submission.Time" = "pa_1sub_time",
                     "Submission.Time" = "pa_sub_time",
                     "Authorized.Time" = "pa_time",
                     "Status" = "pa_status",
                     "Provisional.Diagnosis" = "diag",
                     "Package/Procedure.Name" = "pkg",
                     "Card.No" = "id_no",
                     "Patient.TPA.ID" = "urn_no",
                     "Relation.with.Primary.Insured/Main.Member" =
                       "relation"))

cl45h<-cl45h[, -c(2:33,37,39:43,45:52,55:59,61:72,74:76)]

cl45h<-rename(cl45h, c("Ref.No" = "ref_no",
                       "First.Submission.Time" = "cl_1sub_time",
                     "Submission.Time" = "cl_sub_time",
                     "Authorized.Time" = "cl_time",
                     "STATUS" = "cl_status",
                     "Package/Procedure.Rate" = "pkg_rate",
                     "Preauth.Amt" = "pa_amt",
                     "Claims.Bill.Amt" = "bill_amt",
                     "Final.App.Amt" = "cl_amt",
                     "Implants.Used" = "implant"))

detach(package:plyr)
library(dplyr)

y45h<-full_join(pa45h,cl45h,by = "ref_no",copy = FALSE)

## clean dates

y45h$adm_time <- as.Date(y45h$adm_time, origin = "1900-01-01")
y45h$dis_time <- as.Date(y45h$dis_time, origin = "1900-01-01")
y45h$pa_sub_time <- as.Date(y45h$pa_sub_time, origin = "1900-01-01")
y45h$pa_time <- as.Date(y45h$pa_time, origin = "1900-01-01")
y45h$pa_1sub_time <- as.Date(y45h$pa_1sub_time, origin = "1900-01-01")
y45h$cl_sub_time <- as.Date(y45h$cl_sub_time, origin = "1900-01-01")
y45h$cl_time <- as.Date(y45h$cl_time, origin = "1900-01-01")
y45h$cl_1sub_time <- as.Date(y45h$cl_1sub_time, origin = "1900-01-01")

y45h$adm_time<-as.factor(y45h$adm_time)
y45h$dis_time<-as.factor(y45h$dis_time)
y45h$pa_1sub_time<-as.factor(y45h$pa_1sub_time)
y45h$pa_sub_time<-as.factor(y45h$pa_sub_time)
y45h$pa_time<-as.factor(y45h$pa_time)
y45h$cl_1sub_time<-as.factor(y45h$cl_1sub_time)
y45h$cl_sub_time<-as.factor(y45h$cl_sub_time)
y45h$cl_time<-as.factor(y45h$cl_time)

# y45h<-mutate(y45h, urn_no = substring(y45h$urn_no, 2))

# y45h[y45h == ""]<- NA

## DC
dc2345h<-YDC29042016

dc2345h<-dc2345h[, -c(7:11,13,16:23,28,33,
                      36:43,46:50,52:65,67:70)]

detach(package:dplyr)
library(plyr)

dc2345h<-rename(dc2345h, c("[REFNO]" = "ref_no",
                       "[Patient.Name]" = "pt_name",
                       "[Gender]" = "gender",
                       "[Patient.Age]" = "age",
                       "[Payer.Zone]" = "payer_zone",
                       "[Diagnostic.Center]" = "hosp_name",
                       "[hospcode]" = "hosp_code",
                       "[Member.Caste/Category]" = "caste",
                       "[Admission.Date]" = "adm_time",
                       "[First.submission.time]" = "cl_1sub_time",
                       "[Submission.Time]" = "cl_sub_time",
                       "[Authorized.Time]" = "cl_time",
                       "[STATUS]" = "cl_status",
                       "[dateorder]" = "dis_time",
                       "[Aliment]" = "diag",
                       "[Package/Procedure.Name]" = "pkg",
                       "[Card.No]" = "id_no",
                       "[Patient.TPA.ID]" = "urn_no",
                       "[Relation.with.Primary.Insured/Main.Member]" =
                         "relation",
                       "[Package/Procedure.Rate]" = "pkg_rate",
                       "[PreauthAmt]" = "pa_amt",
                       "[Claims.Bill.Amt]" = "bill_amt",
                       "[Final.App.Amt]" = "cl_amt"))


## clean dates

dc2345h$dis_time <- strptime(dc2345h$dis_time, format= "%b %d %Y")
dc2345h$adm_time <- as.Date(dc2345h$adm_time, origin = "1900-01-01")
dc2345h$cl_sub_time <- as.Date(dc2345h$cl_sub_time, origin = "1900-01-01")
dc2345h$cl_time <- as.Date(dc2345h$cl_time, origin = "1900-01-01")
dc2345h$cl_1sub_time <- as.Date(dc2345h$cl_1sub_time, origin = "1900-01-01")

dc2345h$adm_time<-as.factor(dc2345h$adm_time)
dc2345h$dis_time<-as.character(dc2345h$dis_time)
dc2345h$dis_time<-as.factor(dc2345h$dis_time)
dc2345h$cl_1sub_time<-as.factor(dc2345h$cl_1sub_time)
dc2345h$cl_sub_time<-as.factor(dc2345h$cl_sub_time)
dc2345h$cl_time<-as.factor(dc2345h$cl_time)

# Row bind PA CL & DC with non matching columns
## plyr

xh<-rbind.fill(y45h,dc2345h)

table(is.na(xh$age))

load("/Volumes/Cheral/Official/CMCHIS/RStudio/Master/Master.RData")

# Merging hosp master with 45H2345DC
hosp_master<-rename(hosp_master,c("hospcode" = "hosp_code",
              "hospname" = "hosp_name",
              "hosploc" = "hosp_zone",
              "hosptype" = "hosp_type",
              "dis_code" = "hosp_zone_code"))

detach(package:plyr)
library(dplyr)

xh<-left_join(xh, hosp_master, by = "hosp_code", copy = FALSE)

xh<-xh[,-29]

detach(package:dplyr)
library(plyr)

xh<-rename(xh, c("hosp_name.x" = "hosp_name"))

detach(package:plyr)
library(dplyr)

rm(cen2011, pkg_master, dis_master, tpa_master,
   Y45HCL29042016, Y45HPA29042016, YDC29042016, hosp_master)

## save

load("/Volumes/Cheral/Official/CMCHIS/RStudio/CMCHIS/Y123H.RData")

rm(cl45h, dc2345h, pa45h, y1h, y2h, y3h, y45h, yh12, yh3)

# row bind all to get final data
detach(package:dplyr)
library(plyr)

fh<-rbind.fill(yh,xh)

detach(package:plyr)
library(dplyr)

table(is.na(fh$payer_zone))

rm(xh, yh)

## save

# Starting the cleaning Work

fh[fh == ""]<- NA

library(tidyr)

fh<-separate(fh, ref_no, into = c("ref_yr", "ref_oth"),
             sep = "_", remove = FALSE)

table(is.na(fh$ref_yr))

fh<-select(fh,-c(ref_oth))

year<-fh%>%
  group_by(ref_yr)%>%
  summarise(count = n())

fh<-mutate(fh, ins_year = ref_yr, elec_emer = ref_yr)

library(stringr)

fh$ins_year<-str_trim(fh$ins_year)

fh$ins_year[fh$ins_year == "H"] <- "1st Year"
fh$ins_year[fh$ins_year == "EH"] <- "1st Year"
fh$ins_year[fh$ins_year == "2DH"] <- "2nd Year"
fh$ins_year[fh$ins_year == "2E1027849"] <- "2nd Year"
fh$ins_year[fh$ins_year == "2E1028953"] <- "2nd Year"
fh$ins_year[fh$ins_year == "2E1029338"] <- "2nd Year"
fh$ins_year[fh$ins_year == "2E1030863"] <- "2nd Year"
fh$ins_year[fh$ins_year == "2E1032341"] <- "2nd Year"
fh$ins_year[fh$ins_year == "2E1033468"] <- "2nd Year"
fh$ins_year[fh$ins_year == "2E1033515"] <- "2nd Year"
fh$ins_year[fh$ins_year == "2E1039385"] <- "2nd Year"
fh$ins_year[fh$ins_year == "2E1041127"] <- "2nd Year"
fh$ins_year[fh$ins_year == "2EH"] <- "2nd Year"
fh$ins_year[fh$ins_year == "2H"] <- "2nd Year"
fh$ins_year[fh$ins_year == "3dh"] <- "3rd Year"
fh$ins_year[fh$ins_year == "3DH"] <- "3rd Year"
fh$ins_year[fh$ins_year == "3EH"] <- "3rd Year"
fh$ins_year[fh$ins_year == "3h"] <- "3rd Year"
fh$ins_year[fh$ins_year == "3H"] <- "3rd Year"
fh$ins_year[fh$ins_year == "4DH"] <- "4th Year"
fh$ins_year[fh$ins_year == "4EH"] <- "4th Year"
fh$ins_year[fh$ins_year == "4H"] <- "4th Year"
fh$ins_year[fh$ins_year == "5DH"] <- "5th Year"
fh$ins_year[fh$ins_year == "5EH"] <- "5th Year"
fh$ins_year[fh$ins_year == "5H"] <- "5th Year"

table(is.na(fh$ins_year))

year<-fh%>%
  group_by(ins_year)%>%
  summarise(count = n())

fh$elec_emer<-str_trim(fh$elec_emer)

fh$elec_emer[fh$elec_emer == "H"] <- "Elective"
fh$elec_emer[fh$elec_emer == "EH"] <- "Emergency"
fh$elec_emer[fh$elec_emer == "2DH"] <- "Diagnostic"
fh$elec_emer[fh$elec_emer == "2E1027849"] <- "Emergency"
fh$elec_emer[fh$elec_emer == "2E1028953"] <- "Emergency"
fh$elec_emer[fh$elec_emer == "2E1029338"] <- "Emergency"
fh$elec_emer[fh$elec_emer == "2E1030863"] <- "Emergency"
fh$elec_emer[fh$elec_emer == "2E1032341"] <- "Emergency"
fh$elec_emer[fh$elec_emer == "2E1033468"] <- "Emergency"
fh$elec_emer[fh$elec_emer == "2E1033515"] <- "Emergency"
fh$elec_emer[fh$elec_emer == "2E1039385"] <- "Emergency"
fh$elec_emer[fh$elec_emer == "2E1041127"] <- "Emergency"
fh$elec_emer[fh$elec_emer == "2EH"] <- "Emergency"
fh$elec_emer[fh$elec_emer == "2H"] <- "Elective"
fh$elec_emer[fh$elec_emer == "3dh"] <- "Diagnostic"
fh$elec_emer[fh$elec_emer == "3DH"] <- "Diagnostic"
fh$elec_emer[fh$elec_emer == "3EH"] <- "Emergency"
fh$elec_emer[fh$elec_emer == "3h"] <- "Elective"
fh$elec_emer[fh$elec_emer == "3H"] <- "Elective"
fh$elec_emer[fh$elec_emer == "4DH"] <- "Diagnostic"
fh$elec_emer[fh$elec_emer == "4EH"] <- "Emergency"
fh$elec_emer[fh$elec_emer == "4H"] <- "Elective"
fh$elec_emer[fh$elec_emer == "5DH"] <- "Diagnostic"
fh$elec_emer[fh$elec_emer == "5EH"] <- "Emergency"
fh$elec_emer[fh$elec_emer == "5H"] <- "Elective"

table(is.na(fh$elec_emer))

emer<-fh%>%
  group_by(elec_emer)%>%
  summarise(count = n())

fh<-select(fh,-c(ref_yr))

load("/Volumes/Cheral/Official/CMCHIS/RStudio/Master/Master.RData")

dis_master<-dis_master[,-2]

fh<-left_join(fh,dis_master,by = c("payer_zone"="Var1"),copy = FALSE)

table(is.na(fh$edis_name))

fh<-mutate(fh, payer_zone=edis_name)
fh<-select(fh,-c(edis_name))

detach(package:dplyr)
library(plyr)

fh<-rename(fh,c("edis_code" = "payer_zone_code"))

table(is.na(fh$payer_zone))
table(is.na(fh$hosp_zone))

detach(package:plyr)
library(dplyr)

fh<-left_join(fh, tpa_master,
              by = c("payer_zone" = "edis_name" , "ins_year"),
              copy = FALSE)

table(is.na(fh$tpa))

fh<-select(fh,-c(payer_zone.y,edis_name_c,edis_code))

fh<-separate(fh,age,into = c("age_no", "age_unit"),
              sep = " ", remove = FALSE)

fh<-mutate(fh,age=ifelse(age_unit=="Days",
                           as.numeric(as.numeric(age_no)/365),
                    ifelse(age_unit=="Months",
                           as.numeric(as.numeric(age_no)/12),
                           ifelse(age_unit=="Years",
                                  as.numeric(age_no),
                                  as.numeric(0)))))

fh$age<-abs(fh$age)
fh$age<-round(fh$age)

fh<-select(fh,-c(age_no,age_unit))

table(is.na(fh$age))

# creating age cat
## reshape2
### 16 category
library(reshape2)

attach(fh)
fh$agecat16[age >= 0 & age <=1 ] <- "A (0-1)"
fh$agecat16[age > 1 & age <=5 ] <- "B (1-5)"
fh$agecat16[age > 5 & age <=12 ] <- "C (5-12)"
fh$agecat16[age > 12 & age <=18 ] <- "D (12-18)"
fh$agecat16[age > 18 & age <=25 ] <- "E (18-25)"
fh$agecat16[age > 25 & age <=30 ] <- "F (25-30)"
fh$agecat16[age > 30 & age <=35 ] <- "G (30-35)"
fh$agecat16[age > 35 & age <=40 ] <- "H (35-40)"
fh$agecat16[age > 40 & age <=45 ] <- "I (40-45)"
fh$agecat16[age > 45 & age <=50 ] <- "J (45-50)"
fh$agecat16[age > 50 & age <=55 ] <- "K (50-55)"
fh$agecat16[age > 55 & age <=60 ] <- "L (55-60)"
fh$agecat16[age > 60 & age <=65 ] <- "M (60-65)"
fh$agecat16[age > 65 & age <=70 ] <- "N (65-70)"
fh$agecat16[age > 70 & age <=75 ] <- "O (70-75)"
fh$agecat16[age > 75] <- "P (75+)"
detach(fh)

### 9 category
attach(fh)
fh$agecat9[age >= 0 & age <=1 ] <- "A (0-1)"
fh$agecat9[age > 1 & age <=5 ] <- "B (1-5)"
fh$agecat9[age > 5 & age <=12 ] <- "C (5-12)"
fh$agecat9[age > 12 & age <=18 ] <- "D (12-18)"
fh$agecat9[age > 18 & age <=35 ] <- "E (18-35)"
fh$agecat9[age > 35 & age <=50 ] <- "F (35-50)"
fh$agecat9[age > 50 & age <=60 ] <- "G (50-60)"
fh$agecat9[age > 60 & age <=75 ] <- "H (60-75)"
fh$agecat9[age > 75 ] <- "I (75+)"
detach(fh)

### 6 category
attach(fh)
fh$agecat6[age >= 0 & age <=1 ] <- "A (0-1)"
fh$agecat6[age > 1 & age <=5 ] <- "B (1-5)"
fh$agecat6[age > 5 & age <=18 ] <- "C (5-18)"
fh$agecat6[age > 18 & age <=35 ] <- "D (18-35)"
fh$agecat6[age > 35 & age <=60 ] <- "E (35-60)"
fh$agecat6[age > 60 ] <- "F (60+)"
detach(fh)

detach(package:reshape2)

# creating relation code
## repeat the code twice
fh<-mutate(fh, rel_code = substring(fh$relation, 1, 1))
fh<-mutate(fh, relation = substring(fh$relation, 2))
fh<-mutate(fh, relation = substring(fh$relation, 2))

# creating speciality list

fh<-separate(fh, pkg,into = c("pkg_code", "pkg_name"),
              sep = " : ", remove = FALSE)
fh<-separate(fh, pkg_code,into = c("pkg_code1", "pkg_name1"),
              sep = ": ", remove = FALSE)
fh<-separate(fh, pkg_code1,into = c("pkg_code2", "pkg_name2"),
              sep = " :", remove = FALSE)


fh<-select(fh,-c(pkg_code,pkg_code1,pkg_name,pkg_name,pkg_name1,pkg_name2))
fh[fh == ""]<- NA

tyu<-fh%>%group_by(pkg_code2, pkg)%>%summarise(count = n())

detach(package:dplyr)
library(plyr)

fh<-rename(fh, c("pkg_code2" = "pkg_code"))

detach(package:plyr)
library(dplyr)

fh[392283,"pkg_code"][is.na(fh[392283,"pkg_code"])]<-"TN0622"
fh[96251,"pkg_code"][fh[96251,"pkg_code"] == "TN0600Vitrectomy - Membrane Peeling- Endolaser , Silicon Oil"]<-"TN0600"
fh[1227423,"pkg_code"][fh[1227423,"pkg_code"] == "TNpr20"]<-"TN0620"
fh[747166,"pkg_code"][fh[747166,"pkg_code"] == "TN07022"]<-"TN0702"
fh[297317,"pkg_code"][fh[297317,"pkg_code"] == "TN0515 Spinal Fixation R"]<-"TN0515"
fh[300278,"pkg_code"][fh[300278,"pkg_code"] == "Laproscopic ovariyan cystectomy"]<-NA
fh[917574,"pkg_code"][fh[917574,"pkg_code"] == "thoracotomy and left upper lobe lobectomy"]<-NA


table(is.na(fh$pkg_code))

library(stringr)

fh$pkg_code<-str_trim(fh$pkg_code)

detach(package:stringr)

fh$pkg_code[fh$pkg_code == "DS0023"] <- "DS0023 A"
fh$pkg_code[fh$pkg_code == "FP0092-a"] <- "FP0092"

fh<-left_join(fh, pkg_master,
               by = c("pkg_code" = "pkgcode1"),
                      copy = FALSE)

fh<-mutate(fh, pkg_code = pkgcode)

table(is.na(fh$pkg_code))
table(is.na(fh$speciality))

tm<-fh%>%group_by(pkg_code,pkg,speciality)%>%summarise(count = n())

fh<-mutate(fh, pkg_code = pkgcode, pkg = pkg_procedure_name)

fh<-select(fh,-c(pkgcode,pkg_procedure_name))

rm(cen2011,dis_master,hosp_master,pkg_master,tpa_master,tyu,tm,emer,year)

## Cleaning the dates

table(is.na(fh$pa_1sub_time))
fh$pa_1sub_time <- strptime(fh$pa_1sub_time, format= "%Y-%m-%d")
fh$pa_1sub_time<-format(fh$pa_1sub_time, format="%d-%b-%Y")
table(is.na(fh$pa_1sub_time))

table(is.na(fh$pa_sub_time))
fh$pa_sub_time <- strptime(fh$pa_sub_time, format= "%Y-%m-%d")
fh$pa_sub_time<-format(fh$pa_sub_time, format="%d-%b-%Y")
table(is.na(fh$pa_sub_time))

table(is.na(fh$pa_time))
fh$pa_time <- strptime(fh$pa_time, format= "%Y-%m-%d")
fh$pa_time<-format(fh$pa_time, format="%d-%b-%Y")
table(is.na(fh$pa_time))

table(is.na(fh$cl_1sub_time))
fh$cl_1sub_time <- strptime(fh$cl_1sub_time, format= "%Y-%m-%d")
fh$cl_1sub_time<-format(fh$cl_1sub_time, format="%d-%b-%Y")
table(is.na(fh$cl_1sub_time))

table(is.na(fh$cl_sub_time))
fh$cl_sub_time <- strptime(fh$cl_sub_time, format= "%Y-%m-%d")
fh$cl_sub_time<-format(fh$cl_sub_time, format="%d-%b-%Y")
table(is.na(fh$cl_sub_time))

table(is.na(fh$cl_time))
fh$cl_time <- strptime(fh$cl_time, format= "%Y-%m-%d")
fh$cl_time<-format(fh$cl_time, format="%d-%b-%Y")
table(is.na(fh$cl_time))

table(is.na(fh$adm_time))
fh$adm_time <- strptime(fh$adm_time, format= "%Y-%m-%d")
fh$adm_time<-format(fh$adm_time, format="%d-%b-%Y")
table(is.na(fh$adm_time))

table(is.na(fh$dis_time))
fh$dis_time <- strptime(fh$dis_time, format= "%Y-%m-%d")
fh$dis_time<-format(fh$dis_time, format="%d-%b-%Y")
table(is.na(fh$dis_time))

# urn_no cleaning
library(dplyr)
library(tidyr)
library(stringr)

fh$pt_name<-str_replace_all(fh$pt_name, "[^[:alnum:][:blank:].]", "")
fh$urn_no<-str_replace_all(fh$urn_no, "[^[:alnum:][:blank:]]", "")
fh$id_no<-str_replace_all(fh$id_no, "[^[:alnum:][:blank:]]", "")

fh$pt_name<-toupper(fh$pt_name)
fh$urn_no<-toupper(fh$urn_no)
fh$id_no<-toupper(fh$id_no)

fh[fh == ""]<- NA

fh$urn_no_clean<-str_extract(fh$urn_no, "0133[0-9]{18}")
fh$id_no_clean<-str_extract(fh$id_no, "[0-9]{2}[A-Z]{1}[0-9]{7}")
fh$urn_no_clean1<-str_extract(fh$id_no, "0133[0-9]{18}")
fh$id_no_clean1<-str_extract(fh$urn_no, "[0-9]{2}[A-Z]{1}[0-9]{7}")
fh$oap<-str_extract(fh$id_no, "OAP[0-9]{3,20}")
fh$oap1<-str_extract(fh$id_no, "[0-9]{4,20}OAP")

fh<-mutate(fh, urn_clean = ifelse(!is.na(urn_no_clean),
                                   urn_no_clean,urn_no_clean1))

fh<-mutate(fh, id_clean = ifelse(!is.na(id_no_clean),
                                  id_no_clean,id_no_clean1))

fh<-mutate(fh, oap_clean = ifelse(!is.na(oap),
                                   oap,oap1))

fh <- select(fh, -c(urn_no_clean,urn_no_clean1,id_no_clean,id_no_clean1,oap,oap1))

table(is.na(fh$urn_no_clean))
table(is.na(fh$urn_no_clean1))
table(is.na(fh$urn_clean))

table(is.na(fh$id_no_clean))
table(is.na(fh$id_no_clean1))
table(is.na(fh$id_clean))

table(is.na(fh$oap))
table(is.na(fh$oap1))
table(is.na(fh$oap_clean))

fh[fh == ""]<- NA

## creating final status by merging pa_status with NA of cl_status.

fh<-mutate(fh, final_status = cl_status, fin_st = pa_status)

fh <- transform(fh, final_status = sprintf('CL - %s', final_status))
fh <- transform(fh, fin_st = sprintf('PA - %s', fin_st))

fh$final_status[fh$final_status == "CL - NA"]<-NA
fh$fin_st[fh$fin_st == "PA - NA"]<-NA

fh$final_status[is.na(fh$final_status)] <- as.character(fh$fin_st[is.na(fh$final_status)])

table(is.na(fh$final_status))

fh <- select(fh,-c(fin_st))

## stage of the process

fh<-separate(fh, final_status, into = c("stage", "status"),
             sep = " - ", remove = FALSE)

fh <- select(fh, -c(status))

table(is.na(fh$stage))

a <- fh %>% group_by(stage) %>% summarise(count = n())

rm(a)

## reassigning the elec_emer

x<-fh%>%group_by(elec_emer)%>%summarise(count = n())

fh$elec_emer[fh$speciality == "DIAGNOSTICS"]<-"Diagnostic"

y<-fh%>%group_by(elec_emer)%>%summarise(count = n())

rm(x,y)

## save

## creating stayal & tat

library(lubridate)

fh<-mutate(fh, stayal = dmy(dis_time) - dmy(adm_time))
fh<-mutate(fh, cl_tat = dmy(cl_time) - dmy(cl_1sub_time))
fh<-mutate(fh, pa_tat = dmy(pa_time) - dmy(pa_1sub_time))
fh<-mutate(fh, cl_tat1 = dmy(cl_time) - dmy(cl_sub_time))
fh<-mutate(fh, pa_tat1 = dmy(pa_time) - dmy(pa_sub_time))

fh$stayal<-as.numeric(fh$stayal)
fh$cl_tat<-as.numeric(fh$cl_tat)
fh$pa_tat<-as.numeric(fh$pa_tat)
fh$cl_tat1<-as.numeric(fh$cl_tat1)
fh$pa_tat1<-as.numeric(fh$pa_tat1)

fh$stayal[fh$stayal <= 0]<-0
fh$pa_tat[fh$pa_tat <= 0]<-0
fh$pa_tat1[fh$pa_tat1 <= 0]<-0
fh$cl_tat[fh$cl_tat <= 0]<-0
fh$cl_tat1[fh$cl_tat1 <= 0]<-0

detach(package:lubridate)

## caste workup

x<-fh%>%group_by(caste)%>%summarise(count = n())

fh$caste_tn<-ifelse(fh$caste == "FC", "General", fh$caste)
fh$caste_in<-ifelse(fh$caste_tn == "BC", "General", fh$caste_tn)
fh$caste_in<-ifelse(fh$caste_in == "MBC", "General", fh$caste_in)

y<-fh%>%group_by(caste_tn)%>%summarise(count = n())
z<-fh%>%group_by(caste_in)%>%summarise(count = n())
x<-fh%>%group_by(caste)%>%summarise(count = n())

rm(x,y,z)

## save

## creating migration

fh<-mutate(fh, migration = payer_zone_code - hosp_zone_code)

fh$migration<-ifelse(fh$migration == 0, "No Migration", "Migration")

table(is.na(fh$migration))

## mortality

library(openxlsx)

mortality<-readWorkbook("/Volumes/Cheral/Official/CMCHIS/CMCHIS Dump/1H to 5H Raw Data_29.04.2016/Raw/Mortality data 06_May_2016.xlsx",
                        sheet = 1, startRow = 1, colNames = TRUE)

detach(package:openxlsx)

library(dplyr)

fh<-left_join(fh, mortality, by = "ref_no", copy = FALSE)

fh[fh == ""]<- NA

fh$mortality[is.na(fh$mortality)]<-"Alive"

table(is.na(fh$mortality))
zxc<-fh%>%group_by(mortality)%>%summarise(count = n())

rm(mortality, zxc)

## change class of variable

fh$ref_no<-as.factor(as.character(fh$ref_no))
fh$pt_name<-as.factor(as.character(fh$pt_name))
fh$gender<-as.factor(as.character(fh$gender))
fh$payer_zone<-as.factor(as.character(fh$payer_zone))
fh$hosp_code<-as.factor(as.character(fh$hosp_code))
fh$hosp_name<-as.factor(as.character(fh$hosp_name))
fh$hosp_type<-as.factor(as.character(fh$hosp_type))
fh$hosp_zone<-as.factor(as.character(fh$hosp_zone))
fh$caste<-as.factor(as.character(fh$caste))
fh$id_no<-as.factor(as.character(fh$id_no))
fh$urn_no<-as.factor(as.character(fh$urn_no))
fh$relation<-as.factor(as.character(fh$relation))
fh$adm_time<-as.factor(as.character(fh$adm_time))
fh$dis_time<-as.factor(as.character(fh$dis_time))
fh$pa_1sub_time<-as.factor(as.character(fh$pa_1sub_time))
fh$pa_sub_time<-as.factor(as.character(fh$pa_sub_time))
fh$pa_time<-as.factor(as.character(fh$pa_time))
fh$pa_status<-as.factor(as.character(fh$pa_status))
fh$diag<-as.factor(as.character(fh$diag))
fh$pkg<-as.factor(as.character(fh$pkg))
fh$pkg_code<-as.factor(as.character(fh$pkg_code))
fh$cl_time<-as.factor(as.character(fh$cl_time))
fh$cl_sub_time<-as.factor(as.character(fh$cl_sub_time))
fh$cl_1sub_time<-as.factor(as.character(fh$cl_1sub_time))
fh$cl_status<-as.factor(as.character(fh$cl_status))
fh$bill_amt<-as.numeric(as.character(fh$bill_amt))
fh$implant<-as.factor(as.character(fh$implant))
fh$ins_year<-as.factor(as.character(fh$ins_year))
fh$elec_emer<-as.factor(as.character(fh$elec_emer))
fh$tpa<-as.factor(as.character(fh$tpa))
fh$agecat16<-as.factor(as.character(fh$agecat16))
fh$agecat9<-as.factor(as.character(fh$agecat9))
fh$agecat6<-as.factor(as.character(fh$agecat6))
fh$rel_code<-as.factor(as.character(fh$rel_code))
fh$speciality<-as.factor(as.character(fh$speciality))
fh$urn_clean<-as.factor(as.character(fh$urn_clean))
fh$id_clean<-as.factor(as.character(fh$id_clean))
fh$oap_clean<-as.factor(as.character(fh$oap_clean))
fh$final_status<-as.factor(as.character(fh$final_status))
fh$stage<-as.factor(as.character(fh$stage))
fh$caste_tn<-as.factor(as.character(fh$caste_tn))
fh$caste_in<-as.factor(as.character(fh$caste_in))
fh$migration<-as.factor(as.character(fh$migration))
fh$mortality<-as.factor(as.character(fh$mortality))

## rename speciality

dep<-fh%>%group_by(speciality)%>%summarise(count = n())

library(reshape2)

attach(fh)
fh$dept[speciality == "CARDIOLOGY"] <- "Cardio"
fh$dept[speciality == "CARDIOTHORACIC SURGERIES"] <- "CTS"
fh$dept[speciality == "CHEST SURGERY"] <- "Chest Surg"
fh$dept[speciality == "DERMATOLOGY"] <- "Derm"
fh$dept[speciality == "DIAGNOSTICS"] <- "Diag"
fh$dept[speciality == "ENDOCRINOLOGY"] <- "Endocrine"
fh$dept[speciality == "FOLLOW UP PROCEDURES"] <- "FP"
fh$dept[speciality == "GASTROENTEROLOGY"] <- "Med Gastro"
fh$dept[speciality == "GENERAL MEDICINE"] <- "Gen Med"
fh$dept[speciality == "GENERAL SURGERY"] <- "Gen Surg"
fh$dept[speciality == "GENITOURINARY SURGERY"] <- "Uro"
fh$dept[speciality == "GYNAECOLOGY & OBSTETRIC SURGERY"] <- "O&G"
fh$dept[speciality == "HEPATOLOGY"] <- "Hepatology"
fh$dept[speciality == "INTERVENTIONAL RADIOLOGY"] <- "Int Radiology"
fh$dept[speciality == "MEDICAL ONCOLOGY"] <- "Med Onco"
fh$dept[speciality == "NEONATOLOGY"] <- "NICU"
fh$dept[speciality == "NEPHROLOGY"] <- "Nephro"
fh$dept[speciality == "NEUROLOGY"] <- "Neuro"
fh$dept[speciality == "NEUROSURGERY"] <- "Neuro Surgery"
fh$dept[speciality == "OPHTHALMOLOGY SURGERIES"] <- "Ophthal"
fh$dept[speciality == "ORTHOPEDIC TRAUMA"] <- "Ortho & Trauma"
fh$dept[speciality == "PAEDIATRIC INTENSIVE CARE"] <- "PICU"
fh$dept[speciality == "PAEDIATRICS"] <- "Paed"
fh$dept[speciality == "PLASTIC SURGERY"] <- "Plastic Surg"
fh$dept[speciality == "POLY TRAUMA"] <- "Poly Trauma"
fh$dept[speciality == "PULMONLOGY"] <- "Pulmonology"
fh$dept[speciality == "RADIATION ONCOLOGY"] <- "Rad Onco"
fh$dept[speciality == "REPLACEMENT"] <- "Replacement"
fh$dept[speciality == "RHEUMATOLOGY"] <- "Rheumatology"
fh$dept[speciality == "SURGICAL GASTRO ENTEROLOGY"] <- "Surg Gastro"
fh$dept[speciality == "SURGICAL ONCOLOGY"] <- "Surg Onco"
fh$dept[speciality == "TRANSPLANTATION"] <- "Transplant"
fh$dept[speciality == "VASCULAR SURGERIES"] <- "Vascular Surg"
fh$dept[speciality == "ENT"] <- "ENT"
fh$dept[speciality == "PAEDIATRIC SURGERIES"] <- "Paed Surg"

detach(fh)

detach(package:reshape2)

fh$dept<-as.factor(as.character(fh$dept))

dep1<-fh%>%group_by(dept)%>%summarise(count = n())

table(is.na(fh$dept))
table(is.na(fh$speciality))

rm(dep, dep1)

## fill pkg_rate, pa_amt, bill_amt from preauth data

load("/Volumes/Cheral/Official/CMCHIS/RStudio/CMCHIS/Y123HRaw.RData")
load("/Volumes/Cheral/Official/CMCHIS/RStudio/CMCHIS/Y45HDCRaw29042016.RData")

y1pa<-Y1HPA02122014
y2pa<-Y2HPA27052015
y3pa<-Y3HPA31032016
y45pa<-Y45HPA29042016

rm(Y1HPA02122014,Y1HCL02122014,Y2HPA27052015,Y2HCL27052015,
   Y3HPA31032016,Y3HCL31032016,Y45HPA29042016,Y45HCL29042016,YDC29042016)

y1<-select(y1pa, c(1,43,52:53))
y2<-select(y2pa, c(1,43,52:53))
y3<-select(y3pa, c(1,45,54:55))
y45<-select(y45pa, c(1,44,53:54))

rm(y1pa,y2pa,y3pa,y45pa)

detach(package:dplyr)
library(plyr)

yrate<-rbind.fill(y1,y2,y3,y45)

yrate<-rename(yrate, c("Package/Procedure.Rate" = "pkg.rate"))
yrate<-rename(yrate, c("Ref.No" = "ref_no"))

detach(package:plyr)
library(dplyr)

yrate$ref_no<-as.factor(as.character(yrate$ref_no))

yrate$pkg.rate[yrate$pkg.rate == 0]<-NA
yrate$Bill.Amt[yrate$Bill.Amt == 0]<-NA
yrate$App.Amt[yrate$App.Amt == 0]<-NA

fh<-left_join(fh, yrate, by = "ref_no", copy = FALSE)

fh$pkg_rate[fh$pkg_rate == 0]<-NA
fh$bill_amt[fh$bill_amt == 0]<-NA
fh$pa_amt[fh$pa_amt == 0]<-NA
fh$cl_amt[fh$cl_amt == 0]<-NA

fh$pkg_rate[is.na(fh$pkg_rate)] <- as.character(fh$pkg.rate[is.na(fh$pkg_rate)])
fh$pa_amt[is.na(fh$pa_amt)] <- as.character(fh$App.Amt[is.na(fh$pa_amt)])
fh$bill_amt[is.na(fh$bill_amt)] <- as.character(fh$Bill.Amt[is.na(fh$bill_amt)])

fh<-select(fh,-c(pkg.rate,Bill.Amt,App.Amt))

fh$ref_no<-as.factor(as.character(fh$ref_no))
fh$pkg_rate<-as.numeric(as.character(fh$pkg_rate))
fh$pa_amt<-as.numeric(as.character(fh$pa_amt))
fh$bill_amt<-as.numeric(as.character(fh$bill_amt))

rm(yrate,y1,y2,y3,y45)

## rate cut

fh<-mutate(fh, ratecut_pkg = pkg_rate - cl_amt,
            ratecut_pa = pa_amt - cl_amt,
            oop = bill_amt - cl_amt)

fh$ratecut_pkg[fh$ratecut_pkg <= 0]<-0
fh$ratecut_pa[fh$ratecut_pa <= 0]<-0
fh$oop[fh$oop <= 0]<-0

fh$oop1<-ifelse(fh$oop <= 0, "No OOP", "OOP")
fh$ratecut_pkg1<-ifelse(fh$ratecut_pkg <= 0, "No Rate Cut", "Rate Cut")
fh$ratecut_pa1<-ifelse(fh$ratecut_pa <= 0, "No Rate Cut", "Rate Cut")
fh$ratecut_pkg_sig<-ifelse((fh$ratecut_pkg/fh$pkg_rate)*100 <= 10,
                           "No Rate Cut", "Sig. Rate Cut")
fh$ratecut_pa_sig<-ifelse((fh$ratecut_pa/fh$pa_amt)*100 <= 10,
                          "No Rate Cut", "Sig. Rate Cut")

fh$oop1<-as.factor(as.character(fh$oop1))
fh$ratecut_pkg1<-as.factor(as.character(fh$ratecut_pkg1))
fh$ratecut_pa1<-as.factor(as.character(fh$ratecut_pa1))
fh$ratecut_pkg_sig<-as.factor(as.character(fh$ratecut_pkg_sig))
fh$ratecut_pa_sig<-as.factor(as.character(fh$ratecut_pa_sig))

## claim amount category

library(reshape2)

attach(fh)
fh$pkg_rate_cat[pkg_rate >= 0 & pkg_rate <=1000 ] <- "A (0-1000)"
fh$pkg_rate_cat[pkg_rate > 1000 & pkg_rate <=5000 ] <- "B (1000-5000)"
fh$pkg_rate_cat[pkg_rate > 5000 & pkg_rate <=10000 ] <- "C (5000-10000)"
fh$pkg_rate_cat[pkg_rate > 10000 & pkg_rate <=25000 ] <- "D (10000-25000)"
fh$pkg_rate_cat[pkg_rate > 25000 & pkg_rate <=50000 ] <- "E (25000-50000)"
fh$pkg_rate_cat[pkg_rate > 50000 & pkg_rate <=75000 ] <- "F (50000-75000)"
fh$pkg_rate_cat[pkg_rate > 75000 & pkg_rate <=100000 ] <- "G (75000-100000)"
fh$pkg_rate_cat[pkg_rate > 100000 & pkg_rate <=150000 ] <- "H (100000-150000)"
fh$pkg_rate_cat[pkg_rate > 150000] <- "I (150000+)"

fh$pa_amt_cat[pa_amt >= 0 & pa_amt <=1000 ] <- "A (0-1000)"
fh$pa_amt_cat[pa_amt > 1000 & pa_amt <=5000 ] <- "B (1000-5000)"
fh$pa_amt_cat[pa_amt > 5000 & pa_amt <=10000 ] <- "C (5000-10000)"
fh$pa_amt_cat[pa_amt > 10000 & pa_amt <=25000 ] <- "D (10000-25000)"
fh$pa_amt_cat[pa_amt > 25000 & pa_amt <=50000 ] <- "E (25000-50000)"
fh$pa_amt_cat[pa_amt > 50000 & pa_amt <=75000 ] <- "F (50000-75000)"
fh$pa_amt_cat[pa_amt > 75000 & pa_amt <=100000 ] <- "G (75000-100000)"
fh$pa_amt_cat[pa_amt > 100000 & pa_amt <=150000 ] <- "H (100000-150000)"
fh$pa_amt_cat[pa_amt > 150000] <- "I (150000+)"

fh$bill_amt_cat[bill_amt >= 0 & bill_amt <=1000 ] <- "A (0-1000)"
fh$bill_amt_cat[bill_amt > 1000 & bill_amt <=5000 ] <- "B (1000-5000)"
fh$bill_amt_cat[bill_amt > 5000 & bill_amt <=10000 ] <- "C (5000-10000)"
fh$bill_amt_cat[bill_amt > 10000 & bill_amt <=25000 ] <- "D (10000-25000)"
fh$bill_amt_cat[bill_amt > 25000 & bill_amt <=50000 ] <- "E (25000-50000)"
fh$bill_amt_cat[bill_amt > 50000 & bill_amt <=75000 ] <- "F (50000-75000)"
fh$bill_amt_cat[bill_amt > 75000 & bill_amt <=100000 ] <- "G (75000-100000)"
fh$bill_amt_cat[bill_amt > 100000 & bill_amt <=150000 ] <- "H (100000-150000)"
fh$bill_amt_cat[bill_amt > 150000] <- "I (150000+)"

fh$cl_amt_cat[cl_amt >= 0 & cl_amt <=1000 ] <- "A (0-1000)"
fh$cl_amt_cat[cl_amt > 1000 & cl_amt <=5000 ] <- "B (1000-5000)"
fh$cl_amt_cat[cl_amt > 5000 & cl_amt <=10000 ] <- "C (5000-10000)"
fh$cl_amt_cat[cl_amt > 10000 & cl_amt <=25000 ] <- "D (10000-25000)"
fh$cl_amt_cat[cl_amt > 25000 & cl_amt <=50000 ] <- "E (25000-50000)"
fh$cl_amt_cat[cl_amt > 50000 & cl_amt <=75000 ] <- "F (50000-75000)"
fh$cl_amt_cat[cl_amt > 75000 & cl_amt <=100000 ] <- "G (75000-100000)"
fh$cl_amt_cat[cl_amt > 100000 & cl_amt <=150000 ] <- "H (100000-150000)"
fh$cl_amt_cat[cl_amt > 150000] <- "I (150000+)"
detach(fh)

detach(package:reshape2)

fh$pkg_rate_cat<-as.factor(as.character(fh$pkg_rate_cat))
fh$pa_amt_cat<-as.factor(as.character(fh$pa_amt_cat))
fh$bill_amt_cat<-as.factor(as.character(fh$bill_amt_cat))
fh$cl_amt_cat<-as.factor(as.character(fh$cl_amt_cat))

fh[fh == ""]<- NA

## save




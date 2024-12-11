mat <- read.csv("student-mat.csv",sep=";",header=TRUE)
por <- read.csv("student-por.csv",sep=";",header=TRUE)

merged <- merge(mat,por,by=c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet"))
print(nrow(merged)) # 382 students
write.csv(merged, "uci_student.csv")
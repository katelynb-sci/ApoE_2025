#This is an r-script written to run with R

#Katelyn Baker, University of Colorado Anschutz - Laboratory of Dr. Kimberley Bruce
#2025
#https://github.com/katelynb-sci

#Purpose: combine FIJI output data and exclude cells/regions-of-interests with no DAPI signal
#Image analysis - combining the 3 channels of 3 viewpoints into one .csv file

#Set up-----------
setwd("") #where FIJI output is located

install.packages("dplyr")
install.packages("tidyr")
library("dplyr")
library("tidyr")

getwd()
list.files("")#list files from the wd

 
 
dapis <- lapply(list.files("location", pattern = "dapi_data.csv"), read.csv) #dapis object will include all files from the FIJI output with the dapi_data.csv ending -> all .csvs for DAPI data
phalloidins <- lapply(list.files("location", pattern = "phall_data.csv"), read.csv) #phalloidins object will include all files from the FIJI output with the phall_data.csv ending -> all .csvs for phalloidin data
bodipys <- lapply(list.files("location", pattern = "bodipy_data.csv"), read.csv) #bodipys object will include all files from the FIJI output with the bodipy_data.csv ending -> all .csvs for bodipy data


#Data_Frame
#The following steps are re-organizing the .csv datasets and creating a data-frame for each well picture. Then, it combines each well image to create one large dataframe per well. Then, it removes lines (each line represents a cell/region of interest) that's negative for DAPI (Maximum = 0). Finally, it outputs this filtered data-frame as a single .csv file per well.

#A1
{i<-1
    Well_pic1 <- data.frame(Well_image_num = dapis[[i]]$Label,
                            Mask_number = dapis[[i]]$X, 
                            DAPI_max = dapis[[i]]$Max, 
                            Area = phalloidins[[i]]$Area, 
                            Perimeter = phalloidins[[i]]$Perim.,
                            Circularity = phalloidins[[i]]$Circ.,
                            AR = phalloidins[[i]]$AR, 
                            BX = phalloidins[[i]]$BX,
                            BY = phalloidins[[i]]$BY,
                            Width = phalloidins[[i]]$Width,
                            Height = phalloidins[[i]]$Height,
                            Feret = phalloidins[[i]]$Feret,
                            FeretX = phalloidins[[i]]$FeretX,
                            FeretY = phalloidins[[i]]$FeretY,
                            FeretAngle = phalloidins[[i]]$FeretAngle,
                            FeretMin = phalloidins[[i]]$MinFeret,
                            Roundness = phalloidins[[i]]$Round,
                            Solidity = phalloidins[[i]]$Solidity,
                            Phal_mean = phalloidins[[i]]$Mean,
                            Phal_min = phalloidins[[i]]$Min,
                            Phal_max = phalloidins[[i]]$Max,
                            Phal_int_den = phalloidins[[i]]$IntDen,
                            Phal_raw_int_den = phalloidins[[i]]$RawIntDen,
                            Bodipy_mean = bodipys[[i]]$Mean,
                            Bodipy_min = bodipys[[i]]$Min,
                            Bodipy_max = bodipys[[i]]$Max,
                            Bodipy_int_den = bodipys[[i]]$IntDen,
                            Bodipy_raw_int_den = bodipys[[i]]$RawIntDen)
    Well_pic2 <- data.frame(Well_image_num = dapis[[i+1]]$Label,
                            Mask_number = dapis[[i+1]]$X, 
                            DAPI_max = dapis[[i+1]]$Max, 
                            Area = phalloidins[[i+1]]$Area, 
                            Perimeter = phalloidins[[i+1]]$Perim.,
                            Circularity = phalloidins[[i+1]]$Circ.,
                            AR = phalloidins[[i+1]]$AR, 
                            BX = phalloidins[[i+1]]$BX,
                            BY = phalloidins[[i+1]]$BY,
                            Width = phalloidins[[i+1]]$Width,
                            Height = phalloidins[[i+1]]$Height,
                            Feret = phalloidins[[i+1]]$Feret,
                            FeretX = phalloidins[[i+1]]$FeretX,
                            FeretY = phalloidins[[i+1]]$FeretY,
                            FeretAngle = phalloidins[[i+1]]$FeretAngle,
                            FeretMin = phalloidins[[i+1]]$MinFeret,
                            Roundness = phalloidins[[i+1]]$Round,
                            Solidity = phalloidins[[i+1]]$Solidity,
                            Phal_mean = phalloidins[[i+1]]$Mean,
                            Phal_min = phalloidins[[i+1]]$Min,
                            Phal_max = phalloidins[[i+1]]$Max,
                            Phal_int_den = phalloidins[[i+1]]$IntDen,
                            Phal_raw_int_den = phalloidins[[i+1]]$RawIntDen,
                            Bodipy_mean = bodipys[[i+1]]$Mean,
                            Bodipy_min = bodipys[[i+1]]$Min,
                            Bodipy_max = bodipys[[i+1]]$Max,
                            Bodipy_int_den = bodipys[[i+1]]$IntDen,
                            Bodipy_raw_int_den = bodipys[[i+1]]$RawIntDen)
    total_well <- rbind(Well_pic1, Well_pic2) #combine all 3 pics from the same well together
    total_well <- total_well[total_well$DAPI_max > 0,] #Take out DAPI- cells
    total_well <- subset(total_well, select = -DAPI_max) #Dont want the DAPI column 
    write.csv(total_well,file = "(output location)/(name file).csv")
    }
              
#B1
{i<-3
  Well_pic1 <- data.frame(Well_image_num = dapis[[i]]$Label,
                          Mask_number = dapis[[i]]$X, 
                          DAPI_max = dapis[[i]]$Max, 
                          Area = phalloidins[[i]]$Area, 
                          Perimeter = phalloidins[[i]]$Perim.,
                          Circularity = phalloidins[[i]]$Circ.,
                          AR = phalloidins[[i]]$AR, 
                          BX = phalloidins[[i]]$BX,
                          BY = phalloidins[[i]]$BY,
                          Width = phalloidins[[i]]$Width,
                          Height = phalloidins[[i]]$Height,
                          Feret = phalloidins[[i]]$Feret,
                          FeretX = phalloidins[[i]]$FeretX,
                          FeretY = phalloidins[[i]]$FeretY,
                          FeretAngle = phalloidins[[i]]$FeretAngle,
                          FeretMin = phalloidins[[i]]$MinFeret,
                          Roundness = phalloidins[[i]]$Round,
                          Solidity = phalloidins[[i]]$Solidity,
                          Phal_mean = phalloidins[[i]]$Mean,
                          Phal_min = phalloidins[[i]]$Min,
                          Phal_max = phalloidins[[i]]$Max,
                          Phal_int_den = phalloidins[[i]]$IntDen,
                          Phal_raw_int_den = phalloidins[[i]]$RawIntDen,
                          Bodipy_mean = bodipys[[i]]$Mean,
                          Bodipy_min = bodipys[[i]]$Min,
                          Bodipy_max = bodipys[[i]]$Max,
                          Bodipy_int_den = bodipys[[i]]$IntDen,
                          Bodipy_raw_int_den = bodipys[[i]]$RawIntDen)
  Well_pic2 <- data.frame(Well_image_num = dapis[[i+1]]$Label,
                          Mask_number = dapis[[i+1]]$X, 
                          DAPI_max = dapis[[i+1]]$Max, 
                          Area = phalloidins[[i+1]]$Area, 
                          Perimeter = phalloidins[[i+1]]$Perim.,
                          Circularity = phalloidins[[i+1]]$Circ.,
                          AR = phalloidins[[i+1]]$AR, 
                          BX = phalloidins[[i+1]]$BX,
                          BY = phalloidins[[i+1]]$BY,
                          Width = phalloidins[[i+1]]$Width,
                          Height = phalloidins[[i+1]]$Height,
                          Feret = phalloidins[[i+1]]$Feret,
                          FeretX = phalloidins[[i+1]]$FeretX,
                          FeretY = phalloidins[[i+1]]$FeretY,
                          FeretAngle = phalloidins[[i+1]]$FeretAngle,
                          FeretMin = phalloidins[[i+1]]$MinFeret,
                          Roundness = phalloidins[[i+1]]$Round,
                          Solidity = phalloidins[[i+1]]$Solidity,
                          Phal_mean = phalloidins[[i+1]]$Mean,
                          Phal_min = phalloidins[[i+1]]$Min,
                          Phal_max = phalloidins[[i+1]]$Max,
                          Phal_int_den = phalloidins[[i+1]]$IntDen,
                          Phal_raw_int_den = phalloidins[[i+1]]$RawIntDen,
                          Bodipy_mean = bodipys[[i+1]]$Mean,
                          Bodipy_min = bodipys[[i+1]]$Min,
                          Bodipy_max = bodipys[[i+1]]$Max,
                          Bodipy_int_den = bodipys[[i+1]]$IntDen,
                          Bodipy_raw_int_den = bodipys[[i+1]]$RawIntDen)
  Well_pic3 <- data.frame(Well_image_num = dapis[[i+2]]$Label,
                          Mask_number = dapis[[i+2]]$X, 
                          DAPI_max = dapis[[i+2]]$Max, 
                          Area = phalloidins[[i+2]]$Area, 
                          Perimeter = phalloidins[[i+2]]$Perim.,
                          Circularity = phalloidins[[i+2]]$Circ.,
                          AR = phalloidins[[i+2]]$AR, 
                          BX = phalloidins[[i+2]]$BX,
                          BY = phalloidins[[i+2]]$BY,
                          Width = phalloidins[[i+2]]$Width,
                          Height = phalloidins[[i+2]]$Height,
                          Feret = phalloidins[[i+2]]$Feret,
                          FeretX = phalloidins[[i+2]]$FeretX,
                          FeretY = phalloidins[[i+2]]$FeretY,
                          FeretAngle = phalloidins[[i+2]]$FeretAngle,
                          FeretMin = phalloidins[[i+2]]$MinFeret,
                          Roundness = phalloidins[[i+2]]$Round,
                          Solidity = phalloidins[[i+2]]$Solidity,
                          Phal_mean = phalloidins[[i+2]]$Mean,
                          Phal_min = phalloidins[[i+2]]$Min,
                          Phal_max = phalloidins[[i+2]]$Max,
                          Phal_int_den = phalloidins[[i+2]]$IntDen,
                          Phal_raw_int_den = phalloidins[[i+2]]$RawIntDen,
                          Bodipy_mean = bodipys[[i+2]]$Mean,
                          Bodipy_min = bodipys[[i+2]]$Min,
                          Bodipy_max = bodipys[[i+2]]$Max,
                          Bodipy_int_den = bodipys[[i+2]]$IntDen,
                          Bodipy_raw_int_den = bodipys[[i+2]]$RawIntDen)
  total_well <- rbind(Well_pic1, Well_pic2, Well_pic3) #combine all 3 pics from the same well together
  total_well <- total_well[total_well$DAPI_max > 0,] #Take out DAPI- cells
  total_well <- subset(total_well, select = -DAPI_max) #Dont want the DAPI column 
  write.csv(total_well,file = "(output location)/(name file).csv" )}
#C1
{i<-6
  Well_pic1 <- data.frame(Well_image_num = dapis[[i]]$Label,
                          Mask_number = dapis[[i]]$X, 
                          DAPI_max = dapis[[i]]$Max, 
                          Area = phalloidins[[i]]$Area, 
                          Perimeter = phalloidins[[i]]$Perim.,
                          Circularity = phalloidins[[i]]$Circ.,
                          AR = phalloidins[[i]]$AR, 
                          BX = phalloidins[[i]]$BX,
                          BY = phalloidins[[i]]$BY,
                          Width = phalloidins[[i]]$Width,
                          Height = phalloidins[[i]]$Height,
                          Feret = phalloidins[[i]]$Feret,
                          FeretX = phalloidins[[i]]$FeretX,
                          FeretY = phalloidins[[i]]$FeretY,
                          FeretAngle = phalloidins[[i]]$FeretAngle,
                          FeretMin = phalloidins[[i]]$MinFeret,
                          Roundness = phalloidins[[i]]$Round,
                          Solidity = phalloidins[[i]]$Solidity,
                          Phal_mean = phalloidins[[i]]$Mean,
                          Phal_min = phalloidins[[i]]$Min,
                          Phal_max = phalloidins[[i]]$Max,
                          Phal_int_den = phalloidins[[i]]$IntDen,
                          Phal_raw_int_den = phalloidins[[i]]$RawIntDen,
                          Bodipy_mean = bodipys[[i]]$Mean,
                          Bodipy_min = bodipys[[i]]$Min,
                          Bodipy_max = bodipys[[i]]$Max,
                          Bodipy_int_den = bodipys[[i]]$IntDen,
                          Bodipy_raw_int_den = bodipys[[i]]$RawIntDen)
  Well_pic2 <- data.frame(Well_image_num = dapis[[i+1]]$Label,
                          Mask_number = dapis[[i+1]]$X, 
                          DAPI_max = dapis[[i+1]]$Max, 
                          Area = phalloidins[[i+1]]$Area, 
                          Perimeter = phalloidins[[i+1]]$Perim.,
                          Circularity = phalloidins[[i+1]]$Circ.,
                          AR = phalloidins[[i+1]]$AR, 
                          BX = phalloidins[[i+1]]$BX,
                          BY = phalloidins[[i+1]]$BY,
                          Width = phalloidins[[i+1]]$Width,
                          Height = phalloidins[[i+1]]$Height,
                          Feret = phalloidins[[i+1]]$Feret,
                          FeretX = phalloidins[[i+1]]$FeretX,
                          FeretY = phalloidins[[i+1]]$FeretY,
                          FeretAngle = phalloidins[[i+1]]$FeretAngle,
                          FeretMin = phalloidins[[i+1]]$MinFeret,
                          Roundness = phalloidins[[i+1]]$Round,
                          Solidity = phalloidins[[i+1]]$Solidity,
                          Phal_mean = phalloidins[[i+1]]$Mean,
                          Phal_min = phalloidins[[i+1]]$Min,
                          Phal_max = phalloidins[[i+1]]$Max,
                          Phal_int_den = phalloidins[[i+1]]$IntDen,
                          Phal_raw_int_den = phalloidins[[i+1]]$RawIntDen,
                          Bodipy_mean = bodipys[[i+1]]$Mean,
                          Bodipy_min = bodipys[[i+1]]$Min,
                          Bodipy_max = bodipys[[i+1]]$Max,
                          Bodipy_int_den = bodipys[[i+1]]$IntDen,
                          Bodipy_raw_int_den = bodipys[[i+1]]$RawIntDen)
  total_well <- rbind(Well_pic1, Well_pic2) #combine all 3 pics from the same well together
  total_well <- total_well[total_well$DAPI_max > 0,] #Take out DAPI- cells
  total_well <- subset(total_well, select = -DAPI_max) #Dont want the DAPI column 
  write.csv(total_well,file = "(output location)/(name file).csv")}
#C3
{i<-8
  Well_pic1 <- data.frame(Well_image_num = dapis[[i]]$Label,
                          Mask_number = dapis[[i]]$X, 
                          DAPI_max = dapis[[i]]$Max, 
                          Area = phalloidins[[i]]$Area, 
                          Perimeter = phalloidins[[i]]$Perim.,
                          Circularity = phalloidins[[i]]$Circ.,
                          AR = phalloidins[[i]]$AR, 
                          BX = phalloidins[[i]]$BX,
                          BY = phalloidins[[i]]$BY,
                          Width = phalloidins[[i]]$Width,
                          Height = phalloidins[[i]]$Height,
                          Feret = phalloidins[[i]]$Feret,
                          FeretX = phalloidins[[i]]$FeretX,
                          FeretY = phalloidins[[i]]$FeretY,
                          FeretAngle = phalloidins[[i]]$FeretAngle,
                          FeretMin = phalloidins[[i]]$MinFeret,
                          Roundness = phalloidins[[i]]$Round,
                          Solidity = phalloidins[[i]]$Solidity,
                          Phal_mean = phalloidins[[i]]$Mean,
                          Phal_min = phalloidins[[i]]$Min,
                          Phal_max = phalloidins[[i]]$Max,
                          Phal_int_den = phalloidins[[i]]$IntDen,
                          Phal_raw_int_den = phalloidins[[i]]$RawIntDen,
                          Bodipy_mean = bodipys[[i]]$Mean,
                          Bodipy_min = bodipys[[i]]$Min,
                          Bodipy_max = bodipys[[i]]$Max,
                          Bodipy_int_den = bodipys[[i]]$IntDen,
                          Bodipy_raw_int_den = bodipys[[i]]$RawIntDen)
  Well_pic1 <- Well_pic1[Well_pic1$DAPI_max > 0,] #Take out DAPI- cells
  total_well <- subset(Well_pic1, select = -DAPI_max) #Dont want the DAPI column 
  write.csv(total_well,file = "(output location)/(name file).csv")
  }
#D1
{i<-9
  Well_pic1 <- data.frame(Well_image_num = dapis[[i]]$Label,
                          Mask_number = dapis[[i]]$X, 
                          DAPI_max = dapis[[i]]$Max, 
                          Area = phalloidins[[i]]$Area, 
                          Perimeter = phalloidins[[i]]$Perim.,
                          Circularity = phalloidins[[i]]$Circ.,
                          AR = phalloidins[[i]]$AR, 
                          BX = phalloidins[[i]]$BX,
                          BY = phalloidins[[i]]$BY,
                          Width = phalloidins[[i]]$Width,
                          Height = phalloidins[[i]]$Height,
                          Feret = phalloidins[[i]]$Feret,
                          FeretX = phalloidins[[i]]$FeretX,
                          FeretY = phalloidins[[i]]$FeretY,
                          FeretAngle = phalloidins[[i]]$FeretAngle,
                          FeretMin = phalloidins[[i]]$MinFeret,
                          Roundness = phalloidins[[i]]$Round,
                          Solidity = phalloidins[[i]]$Solidity,
                          Phal_mean = phalloidins[[i]]$Mean,
                          Phal_min = phalloidins[[i]]$Min,
                          Phal_max = phalloidins[[i]]$Max,
                          Phal_int_den = phalloidins[[i]]$IntDen,
                          Phal_raw_int_den = phalloidins[[i]]$RawIntDen,
                          Bodipy_mean = bodipys[[i]]$Mean,
                          Bodipy_min = bodipys[[i]]$Min,
                          Bodipy_max = bodipys[[i]]$Max,
                          Bodipy_int_den = bodipys[[i]]$IntDen,
                          Bodipy_raw_int_den = bodipys[[i]]$RawIntDen)
  Well_pic1 <- Well_pic1[Well_pic1$DAPI_max > 0,] #Take out DAPI- cells
  total_well <- subset(Well_pic1, select = -DAPI_max) #Dont want the DAPI column 
  write.csv(total_well,file = "(output location)/(name file).csv")
}
#D3
{i<-10
  Well_pic1 <- data.frame(Well_image_num = dapis[[i]]$Label,
                          Mask_number = dapis[[i]]$X, 
                          DAPI_max = dapis[[i]]$Max, 
                          Area = phalloidins[[i]]$Area, 
                          Perimeter = phalloidins[[i]]$Perim.,
                          Circularity = phalloidins[[i]]$Circ.,
                          AR = phalloidins[[i]]$AR, 
                          BX = phalloidins[[i]]$BX,
                          BY = phalloidins[[i]]$BY,
                          Width = phalloidins[[i]]$Width,
                          Height = phalloidins[[i]]$Height,
                          Feret = phalloidins[[i]]$Feret,
                          FeretX = phalloidins[[i]]$FeretX,
                          FeretY = phalloidins[[i]]$FeretY,
                          FeretAngle = phalloidins[[i]]$FeretAngle,
                          FeretMin = phalloidins[[i]]$MinFeret,
                          Roundness = phalloidins[[i]]$Round,
                          Solidity = phalloidins[[i]]$Solidity,
                          Phal_mean = phalloidins[[i]]$Mean,
                          Phal_min = phalloidins[[i]]$Min,
                          Phal_max = phalloidins[[i]]$Max,
                          Phal_int_den = phalloidins[[i]]$IntDen,
                          Phal_raw_int_den = phalloidins[[i]]$RawIntDen,
                          Bodipy_mean = bodipys[[i]]$Mean,
                          Bodipy_min = bodipys[[i]]$Min,
                          Bodipy_max = bodipys[[i]]$Max,
                          Bodipy_int_den = bodipys[[i]]$IntDen,
                          Bodipy_raw_int_den = bodipys[[i]]$RawIntDen)
  Well_pic2 <- data.frame(Well_image_num = dapis[[i+1]]$Label,
                          Mask_number = dapis[[i+1]]$X, 
                          DAPI_max = dapis[[i+1]]$Max, 
                          Area = phalloidins[[i+1]]$Area, 
                          Perimeter = phalloidins[[i+1]]$Perim.,
                          Circularity = phalloidins[[i+1]]$Circ.,
                          AR = phalloidins[[i+1]]$AR, 
                          BX = phalloidins[[i+1]]$BX,
                          BY = phalloidins[[i+1]]$BY,
                          Width = phalloidins[[i+1]]$Width,
                          Height = phalloidins[[i+1]]$Height,
                          Feret = phalloidins[[i+1]]$Feret,
                          FeretX = phalloidins[[i+1]]$FeretX,
                          FeretY = phalloidins[[i+1]]$FeretY,
                          FeretAngle = phalloidins[[i+1]]$FeretAngle,
                          FeretMin = phalloidins[[i+1]]$MinFeret,
                          Roundness = phalloidins[[i+1]]$Round,
                          Solidity = phalloidins[[i+1]]$Solidity,
                          Phal_mean = phalloidins[[i+1]]$Mean,
                          Phal_min = phalloidins[[i+1]]$Min,
                          Phal_max = phalloidins[[i+1]]$Max,
                          Phal_int_den = phalloidins[[i+1]]$IntDen,
                          Phal_raw_int_den = phalloidins[[i+1]]$RawIntDen,
                          Bodipy_mean = bodipys[[i+1]]$Mean,
                          Bodipy_min = bodipys[[i+1]]$Min,
                          Bodipy_max = bodipys[[i+1]]$Max,
                          Bodipy_int_den = bodipys[[i+1]]$IntDen,
                          Bodipy_raw_int_den = bodipys[[i+1]]$RawIntDen)
  total_well <- rbind(Well_pic1, Well_pic2) #combine all 3 pics from the same well together
  total_well <- total_well[total_well$DAPI_max > 0,] #Take out DAPI- cells
  total_well <- subset(total_well, select = -DAPI_max) #Dont want the DAPI column 
  write.csv(total_well,file = "(output location)/(name file).csv")}

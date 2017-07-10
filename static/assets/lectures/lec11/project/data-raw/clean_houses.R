###### OS Independent Load

# You may wish to change the `fp` based on your system configuration.

# Handle operating environment
if(Sys.info()[['sysname']]=="Windows"){ # Windows
  fp = "F:/BoxSync/stat385/lectures/lec8/project"
}else if(Sys.info()[['sysname']]=="Darwin"){ # OS X
  fp = "~/BoxSync/stat385/lectures/lec8/project"
}else{
  # Linux   
  stop("I'm a penguin.")
}

# Read in CSV
raw = read.csv(file=file.path(fp, "data-raw","houses_data.csv"), stringsAsFactors=FALSE)

# Line read
reject = scan(file=file.path(fp, "data-raw","reject_list.txt"), what=character(), sep=",")  

####### Package Dependencies

# Any package that is required by the script
# below is given here
inst_pkgs = load_pkgs = c("MASS","faraway","Hmisc",
                          "randomForest","rpart")
# Check to see if the packages are already installed
inst_pkgs = inst_pkgs[!(inst_pkgs %in%
                          installed.packages()[,"Package"])]
# Installs any missing package
if(length(inst_pkgs)) install.packages(inst_pkgs)
# Dynamically load required packages
pkgs_loaded = lapply(load_pkgs, require, character.only=T)

####### Start the purge

houses = raw


## Regex for address split

# Break address
address = tolower(as.character(houses$House_Address))
street = gsub(" ,.*", "", address)
houses$St_Address = street

city = gsub(".*, champaign, .*", "0", address)
city = gsub(".*, urbana, .*", "1", city)
houses$City = as.numeric(city)

zip = gsub(".* , .*, il ", "", address)
houses$ZipCode = as.numeric(zip)

houses$House_Address = NULL

## Update Observations by House Address
## Note: This *could* be turned into a function!!

# Create k
k = which(houses$St_Address == tolower("3909 Aberdeen Dr"))
houses$Bedrooms[k] = "3 beds"
houses$Bathrooms[k] = "2 baths"
houses$lot[k]="3040 sqft"
houses$lastsoldifavailable[k] = "May 2011 for $135,000"

k = which(houses$St_Address == tolower("3201 Fawn Hill Ct"))
houses$Bedrooms[k] = "3 beds"
houses$Bathrooms[k] = "2.5 baths"
houses$lot[k] = "1,863 sqft"
houses$lastsoldifavailable[k] = "May 2012 for $100,000"

k = which(houses$St_Address == tolower("2404 Prairieridge Pl"))
houses$Bedrooms[k] = "4 beds"
houses$Bathrooms[k] = "3 baths"
houses$lot[k] = "2,488 sq ft"
houses$yearbuilt[k] = "2004"
houses$lastsoldifavailable[k] = "Nov 2010 for $330,000"

k = which(houses$St_Address == tolower("2010 Savanna Dr"))
houses$Bedrooms[k] = "4 beds"
houses$Bathrooms[k] = "2.5 baths"
houses$SqFT[k] = "2,918 sq ft"
houses$lot[k]="10,790 sqft"
houses$yearbuilt[k] = "2010"
houses$lastsoldifavailable[k] = "May 2011 for $405,000"

k = which(houses$St_Address == tolower("1905 N Lincoln Ave APT 105"))
houses$Bedrooms[k] = 2
houses$Bathrooms[k] = 2
 
k = which(houses$St_Address == tolower("2408 Windward Blvd Unit 203"))
houses$Price[k] = "$113,000"
houses$lastsoldifavailable[k] = "Oct 2013 for $113,000"

k = which(houses$St_Address == tolower("1914 E Newport Dr"))
houses$Price[k] = "$142,000"
houses$lastsoldifavailable[k] = "Aug 2013 for $142,000"

k = which(houses$St_Address == tolower("901 Scovill St"))
houses$Price[k] = "$149,500"
houses$lastsoldifavailable[k] = "Sep 2013 for $149,500"

k = which(houses$St_Address == tolower("1809 Brad Dr"))
houses$Price[k] = "$106,000"
houses$lastsoldifavailable[k] = "Oct 2013 for $106,000"

k = which(houses$St_Address == tolower("1808 Winchester Dr"))
houses$Bedrooms[k] = 4
houses$Bathrooms[k] = 2
houses$SqFT[k] = "1,437 sq ft"
houses$lot[k]="6,930 sqft"
houses$yearbuilt[k] = "1964"
houses$lastsoldifavailable[k] = "Sep 2013 for $80,000"

k = which(houses$St_Address == tolower("2707 Cherry Hills Dr"))
houses$Bedrooms[k] = 3
houses$Bathrooms[k] = 2
houses$SqFT[k] = "1,976 sq ft"
houses$lot[k]="6,930 sqft"
houses$yearbuilt[k] = "1989"
houses$lastsoldifavailable[k] = "Jul 2011 for $191,500"

k = which(houses$St_Address == tolower("402 E Pennsylvania Ave"))
houses$SqFT[k] = "2,050 sq ft"

k = which(houses$St_Address == tolower("2604 Lakeview Dr"))
houses$Price[k] = "$211,000"
houses$lot[k] = "Unknown"

# After clean mods
k = which(houses$St_Address == tolower("708 Balboa Rd"))
houses$Price[k] = "$122,000"

k = which(houses$St_Address == tolower("1218 Lancaster Dr"))
houses$Price[k] = "$94,000"

k = which(houses$St_Address == tolower("1106 N Mckinley Ave"))
houses$Price[k] = "$90,000"

k = which(houses$St_Address == tolower("3730 Summer Sage Ct"))
houses$Bathrooms[k] = "3.5 baths"

k = which(houses$St_Address == tolower("2106 Vale St"))
houses$Price[k] = "$310,000"

k = which(houses$St_Address == tolower("512 S Edwin St"))
houses$SqFT[k] = "834"

k = which(houses$St_Address == tolower("2709 E High St"))
houses$SqFT[k] = "920"

k = which(houses$St_Address == tolower("2005 Savanna Dr"))
houses$Bathrooms[k] = "2.5 baths"

k = which(houses$St_Address == tolower("1805 Bentbrook Dr"))
houses$Bathrooms[k] = "2.5 baths"

k = which(houses$St_Address == tolower("2417 stillwater dr"))
houses$lot[k] = "2.5 baths"

k = which(houses$St_Address == tolower("1709 brighton ct"))
houses$Bathrooms[k] = "6 baths"

k = which(houses$St_Address == tolower("411 W Indiana Ave"))
houses$Bathrooms[k] = "2 baths"

k = which(houses$St_Address == tolower("1211 W Bradley Ave"))
houses$Price[k] = "$70,000"

k = which(houses$St_Address == tolower("1602 Rutledge Dr"))
houses$Bathrooms[k] = "2.5 baths"

# Drop predictors:
# heattype, zillowdays, cooling, parking, basement, fireplace, floorcover.
start_loc = match("heattype",names(houses))
end_loc = match("floorcover",names(houses))
houses=houses[,-(start_loc:end_loc)]

# Delete headers injected in
houses = houses[-which(houses$lastsoldifavailable=="lastsoldifavailable"),]

# Get unique obs:
houses = unique(houses)

### Use the rejection list

# Remove observations:
reject = reject[which(reject != "")]
reject = tolower(reject)

# Named loop iterator
for(i in reject){
  houses = houses[which(houses$St_Address != i),]
}


## Switch to numeric

# Convert housing price
temp_price=gsub("[[:punct:]]","", houses$Price)
houses$Price=as.numeric(temp_price)

# Bed
bed=gsub(" .*","", houses$Bedrooms)
houses$Bedrooms=as.numeric(bed)

# Bath
bath=gsub("-"," ", houses$Bathrooms)
bath=gsub(" .*","", bath)
houses$Bathrooms=as.numeric(bath)

# Size
temp_SqFT = gsub("[[:punct:]]", "",  houses$SqFT)
temp_SqFT = gsub(" .*","",temp_SqFT)
houses$SqFT = as.numeric(temp_SqFT)

# Lot
temp_lot = gsub("Contact for details","",houses$lot)
temp_lot = gsub("Unknown","",temp_lot)
temp_lot = gsub("-999 sqft","",temp_lot)
temp_lot = gsub("[[:punct:]]","",temp_lot)
size = as.numeric(gsub(" .*","",temp_lot))
unit = gsub(".* ","",temp_lot)

houses$Lot_Size = as.numeric(size)
houses$Lot_Unit = as.character(unit)
houses$Lot_Unit[houses$Lot_Unit==""]=NA
houses$Lot_Size[houses$Lot_Size=="NA"]=NA
houses$lot = NULL

# Year_Built
build_year = gsub("Contact for details","0",houses$yearbuilt)
build_year = gsub("Unknown","0",build_year)
houses$yearbuilt = as.numeric(build_year)
# Any NA values go to 0.
houses$yearbuilt[houses$yearbuilt==0]=NA

# Last housing price information:
# Month
temp_housing = gsub("[[:punct:]]", "",  houses$lastsoldifavailable)
month = gsub("[[:space:]][[:digit:]]{4} for .*", "",temp_housing)
houses$Sold_Month=month

# Year and cost
year_cost = gsub("[[:alpha:]]{3}[[:space:]]", "",temp_housing)
year = gsub("[[:space:]].*", "",year_cost)
cost = gsub("[[:digit:]]{4}[[:space:]]", "",year_cost)
houses$Sold_Year = as.numeric(year)
houses$Sold_Price = as.numeric(cost)
houses$lastsoldifavailable = NULL

# Force to numeric
houses$Price = as.numeric(houses$Price)

# Convert units
houses$Lot_Size[houses$Lot_Unit == "acres" & !is.na(houses$Lot_Unit)] = houses$Lot_Size[houses$Lot_Unit == "acres" & !is.na(houses$Lot_Unit)]*43560
houses$Lot_Unit[houses$Lot_Unit == "acres" & !is.na(houses$Lot_Unit)] = "sqft"

houses$Lot_Unit = NULL

## Exports

save(houses, file=file.path(fp, "data", "cleaned_houses.rda"))
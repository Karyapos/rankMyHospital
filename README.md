# rankMyHospital

## 💡Introduction

This R project analyzes hospital performance across the U.S.

based on 30-day mortality rates for serious conditions.

It includes 3 main functions:

- `best()`: Best hospital in a given state for an outcome
- `rankhospital()`: Hospital of a given rank in a state for an outcome
- `rankall()`: Hospital of rank num in every state for an outcome

## 🩺 Supported Outcomes

- “heart attack”
- “heart failure”
- “pneumonia”

## 📊 Functions

### `best(state, outcome)`

Returns the hospital with the lowest 30-day mortality rate

in the given state for a specific outcome.

```r
 best("TX", "heart attack")
[1] "CYPRESS FAIRBANKS MEDICAL CENTER"
```

### `rankhospital(state, outcome, num = "best")`

Returns the hospital of the given rank (e.g. "best", "worst", or a specific numeric rank) for the selected state and outcome.

```r
rankhospital("TX", "heart failure", 4)
[1] "DETAR HOSPITAL NAVARRO"
```

### `rankall(outcome, num = "best")`

Returns a data frame with the hospital of the given rank for each state.

```r
tail(rankall("pneumonia", "worst"), 3)
                                     hospital state
WI MAYO CLINIC HEALTH SYSTEM - NORTHLAND, INC    WI
WV                     PLATEAU MEDICAL CENTER    WV
WY           NORTH BIG HORN HOSPITAL DISTRICT    WY
```

## 🗃️ Dataset

The data for this assignment come from the Hospital Compare web site run by the [U.S. Department of Health and Human Services](https://www.hhs.gov/).

[Download dataset (zip)](https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip)

The zip file for this assignment contains three files
• *outcome-of-care-measures.csv*: Contains information about 30-day mortality and readmission rates
for heart attacks, heart failure, and pneumonia for over 4,000 hospitals.
• *hospital-data.csv*: Contains information about each hospital.
• *Hospital_Revised_Flatfiles.pdf*: Descriptions of the variables in each file (i.e the code book).

## 🗒️Final Notes

This project was developed as part of an R programming course

focused on data manipulation, functional programming, and

real-world healthcare data analysis. The goal was to explore

hospital ranking techniques using actual datasets while applying

robust input validation, custom sorting logic, and practical

data wrangling skills in R.

For a more detailed project description and documentation,
please see the Notion page here: [https://www.notion.so/RankMyHospital-228434ba3323800680c3e68959efde52?source=copy_link](https://ten-christmas-260.notion.site/RankMyHospital-228434ba3323800680c3e68959efde52?source=copy_link)

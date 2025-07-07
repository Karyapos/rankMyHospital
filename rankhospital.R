rankhospital <- function(state, outcome, num = "best") {
        #Reading the data
        data <- read.csv("outcome-of-care-measures.csv",
                         colClasses = "character")
        #Exporting the column's names
        cols <- colnames(data)
        #Exporting the columns that we are interested in and mapping
        outcome_options <- list(
                "heart attack" = cols[11],
                "heart failure" = cols[17],
                "pneumonia" = cols[23]
        )
        #Input validating (if wrong it will stop)
        if (!(outcome %in% names(outcome_options))) {
                stop("invalid outcome")
        }
        if (!(state %in% data$State)) {
                stop("invalid state")
                
        }
        #Selecting the correct column based on the input
        outcome_col <- outcome_options[[outcome]]
        #Filtering the data based on the input
        state_data <- data[data$State == state, ]
        #Converting outcome column to numeric (suppress warnings)
        state_data[, outcome_col] <- suppressWarnings(
                as.numeric(state_data[, outcome_col]))
        #Cleaning the data from NAs
        clean_data <- state_data[
                !is.na(state_data[, outcome_col]), ]
        #Ordering the data
        clean_data <- clean_data[
                order(clean_data[[outcome_col]],
                      clean_data[, 2]), ]
        hospital_names <- clean_data[, 2]
        #Handling special cases "best" and "worst"
        if (num == "best") {
                return(hospital_names[1])
        }
        if (num == "worst") {
                return(hospital_names[length(hospital_names)])
        }
        #Converting num for comparison
        if (is.character(num)) {
                num <- as.numeric(num)
        }
        #Returning NA if num exceeds available hospitals
        #Else returning the hospital name at the given rank
        if (num > length(hospital_names)) {
                return(NA)
        }
        
        else{
                return(hospital_names[num])
        }
}

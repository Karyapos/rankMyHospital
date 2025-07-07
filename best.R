best <- function(state, outcome) {
        #Reading the data
        data <- read.csv("outcome-of-care-measures.csv",
                         colClasses = "character")
        #Exporting the column's names
        cols <- colnames(data)
        #Exporting the columns that we are interested in and mapping
        outcome_options <- list(
                "heart attack" = cols[13],
                "heart failure" = cols[19],
                "pneumonia" = cols[25]
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
        #Sub-setting the data based on the input
        state_data <- data[data$State == state, ]
        #Convert outcome column to numeric (with suppressed warnings)
        state_data[, outcome_col] <- suppressWarnings(
                as.numeric(state_data[, outcome_col]))
        #Cleaning the data from NAs
        clean_data <- state_data[
                !is.na(state_data[, outcome_col]), ]
        #Getting the minimum mortality value
        min_value <- min(clean_data[, outcome_col])
        #Getting hospital(s) that have the minimum mortality value
        best_hospitals <- clean_data[
                clean_data[, outcome_col] == min_value, 
                "Hospital.Name"]
        #Last,sorting alphabetically and returning the first one
        return(sort(best_hospitals)[1])
        
}

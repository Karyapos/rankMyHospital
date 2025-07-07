rankall <- function(outcome, num = "best") {
        #Reading the data
        data <- read.csv("outcome-of-care-measures.csv",
                         colClasses = "character")
        #Exporting the column names and mapping outcome
        cols <- colnames(data)
        outcome_options <- list(
                "heart attack" = cols[11],
                "heart failure" = cols[17],
                "pneumonia" = cols[23]
        )
        #Input validating (if wrong it will stop)
        if (!(outcome %in% names(outcome_options))) {
                stop("invalid outcome")
        }
        #Selecting the correct column based on the input
        outcome_col <- outcome_options[[outcome]]
        #Converting selected outcome column in numeric data and
        #using suppresWarnings to avoid warning message
        data[, outcome_col] <- suppressWarnings(
                as.numeric(data[, outcome_col]))
        #Cleaning the data from NA as specifically asked
        clean_data <- data[!is.na(data[, outcome_col]), ]
        #Computing value_table (which contains the value in each
        #state and the state 2-character abbreviation) based on num
        if (num == "best") {
                value_table <- tapply(clean_data[[outcome_col]],
                                      clean_data$State, min)
        }
        else if (num == "worst") {
                value_table <- tapply(clean_data[[outcome_col]],
                                      clean_data$State, max)
        }
        #Creating a function to get the "numth" value in a state
        else{
                sorting_function <- function(x) {
                        x <- sort(x, na.last = NA)
                        if (num > length(x))
                        {
                                return(NA)
                        }
                        else {
                                return(x[num])
                        }
                }
                value_table <- tapply(clean_data[[outcome_col]],
                                      clean_data$State,
                                      sorting_function)
        }
        #Creating the "results_df" data frame which will contain
        #"value_table" plus the name of the hospital
        results_df <- data.frame(
                "hospital" = character(),
                "state" = character(),
                "value" = numeric(),
                stringsAsFactors = FALSE
        )
        
        for (st in names(value_table)) {
                val <- value_table[st]
        #If no hospital found(value=NA) return NA for hospital name
                if (is.na(val)) {
                        results_df <- rbind(
                                results_df,
                                data.frame(
                                        "hospital" = NA,
                                        "state" = st,
                                        "value" = NA,
                                        stringsAsFactors = FALSE
                                )
                        )
                        next
                }
                else{
                        hospital_s <- clean_data$Hospital.Name[
                                clean_data[[outcome_col]] == val &
                                clean_data$State == st]
                        hos <- sort(hospital_s)[1]
                        results_df <- rbind(
                                results_df,
                                data.frame(
                                        "hospital" = hos,
                                        "state" = st,
                                        "value" = val,
                                        stringsAsFactors = FALSE
                                )
                        )
                }
        }
        #returning a data frame with first column hospital name and
        #second column the state 2-character abbreviation
        return(results_df[, c("hospital", "state")])
        
}

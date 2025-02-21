# Assignment  : LIS4761 - Assignments - Week 06 Lab - Doing Math in R Part 2
# Purpose     : Perform matrix operations and generate specific matrices
# Author      : Steven Barden
# Created     : 2025-02-20-1300-00
# Modified    : 2025-02-20-1300-00
# Description : Perform matrix addition, subtraction, diagonal matrix creation, and custom matrix generation.

# --- BEGIN SCRIPT ---
# Set the working directory to the specified folder for the course
tryCatch({
  setwd("C:/Users/Steve/OneDrive/College/_____DESKTOP ICONS/2025-USF-Spring/4370/Module06")
}, error = function(e) {
  stop("Error setting the working directory: ", e$message)
})

# Ensures that printed outputs wrap properly within the terminal window.
options(width = as.integer(system2("tput", "cols", stdout = TRUE)))

# Print the current working directory to verify it was set correctly
tryCatch({
  print(getwd())
}, error = function(e) {
  stop("Error retrieving the working directory: ", e$message)
})

# --- UTILITY FUNCTIONS ---
# Function to check, install, and load required libraries
check_and_load_library <- function(package) {
  if (!require(package, character.only = TRUE)) {
    tryCatch({
      cat("Installing package:", package, "\n")
      install.packages(package)
      library(package, character.only = TRUE)
      cat("Successfully loaded:", package, "\n")
    }, error = function(e) {
      stop(paste("Failed to install/load package:", package, "-", e$message))
    })
  } else {
    cat("Package already loaded:", package, "\n")
  }
}

# Required packages (empty for this assignment, as base R suffices)
required_packages <- c()

# Load all required packages
tryCatch({
  lapply(required_packages, check_and_load_library)
}, error = function(e) {
  stop("Package loading failed: ", e$message)
})

# --- MAIN ANALYSIS ---
main_analysis <- function() {
  tryCatch({
    cat("\n1. Matrix Operations with A and B\n")
    A <- matrix(c(2, 0, 1, 3), ncol = 2)
    B <- matrix(c(5, 2, 4, -1), ncol = 2)
    
    # a) A + B
    cat("\na) A + B:\n")
    print(A + B)
    
    # b) A - B
    cat("\nb) A - B:\n")
    print(A - B)
    
    cat("\n2. Diagonal Matrix of Size 4\n")
    diag_matrix <- diag(c(4, 1, 2, 3))
    print(diag_matrix)
    
    cat("\n3. Custom Matrix Generation\n")
    # Initialize a 5x5 matrix with zeros
    custom_matrix <- matrix(0, nrow = 5, ncol = 5)
    
    # Set the diagonal elements to 3
    diag(custom_matrix) <- 3
    
    # Set the first row elements (except diagonal)
    custom_matrix[1, 2:5] <- 1
    
    # Set the first column elements (except diagonal)
    custom_matrix[2:5, 1] <- 2
    
    print(custom_matrix)
    
    cat("\n--- Analysis Completed Successfully ---\n")
  }, error = function(e) {
    stop("Error in main analysis: ", e$message)
  })
}

# --- EXECUTION ---
tryCatch({
  main_analysis()
}, error = function(e) {
  stop("Script execution failed: ", e$message)
})
# --- END OF SCRIPT ---
library(rstudioapi)

source("render_and_push.R")

render_and_push <- function() {
  # Render the Quarto site
  system("quarto render")
  
  # Add changes to Git
  system("git add docs")
  
  # Commit the changes
  commit_message <- readline(prompt = "Enter commit message: ")
  system(paste("git commit -m", shQuote(commit_message)))
  
  # Push to GitHub
  system("git push origin main")
  
  # Confirm success
  message("Rendered and pushed successfully!")
}

render_and_push()


library(shiny)

shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Maffetone Heart Rate Calculator"),

    sidebarPanel(
      numericInput('age', 'Your age (years)', 30, min = 0, max = 100, step = 1),
      radioButtons("case", "Select your case:",
                   c("you have or are recovering from a major illness (heart disease, any operation or hospital stay, etc.) or are on any regular medication" = "minusten",
                     "you are injured, have regressed in training or competition, get more than two colds or bouts of flu per year, have allergies or asthma, or if you have been inconsistent or are just getting back into training" = "minusfive",
                     "you have been training consistently (at least four times weekly) for up to two years without any of the problems just mentioned" = "zero",
                     "you have been training for more than two years without any of the problems listed above, and have made progress in competition without injury" = "plusfive")),
      submitButton('Submit')
    ),
    mainPanel(
        h3('Results'),
        h4('Your age'),
        verbatimTextOutput("inputValueAge"),
        h4('Your case'),
        verbatimTextOutput("inputValueCase"),
        h4('Which resulted in the following maximum aerobic heart rate'),
        verbatimTextOutput("heartrate")
    )
  )
)
library(shiny)

shinyUI(
navbarPage("Maffetone",
tabPanel("Detail",
         h2("The 180 Formula: Heart-rate monitoring for real aerobic training"),
         hr(),
         h3("Description"),
         helpText("A heart-rate monitor is the most important tool for developing optimal endurance and better fat-burning. This simple device is a valuable tool that not only guides your training but is part of an important assessment process, and can even be used in some competitive situations. Unfortunately, most people use their heart-rate monitors only to see how high their heart rate gets during a workout, or evaluate resting heart rate in the morning."),
         helpText("This 180 Formula enables athletes to find the ideal maximum aerobic heart rate in which to base all aerobic training. When exceeded, this number indicates a rapid transition towards anaerobic work."),
         helpText("A good aerobic base isn't important only for endurance athletes. The system that controls the body's stress response is functionally linked to the anaerobic system. In other words, if you depend too much on your anaerobic system, you'll be more stressed, and therefore more likely to overtrain or become injured. I discuss these topics more in depth in The MAF Test and in The New Aerobic Revolution."),

         h3("The 180 Formula"),

         helpText("To find your maximum aerobic training heart rate, there are two important steps."),
         helpText("Subtract your age from 180."),
         helpText("Modify this number by selecting among the following categories the one that best matches your fitness and health profile:"),
         helpText("  a.  If you have or are recovering from a major illness such as heart disease, any operation or hospital stay, etc. or are on any regular medication, subtract an additional 10."),
         helpText("  b.  If you are injured, have regressed in training or competition, get more than two colds or bouts of flu per year, have allergies or asthma, or if you have been inconsistent or are just getting back into training, subtract an additional 5."),
         helpText("  c.  If you have been training consistently (at least four times weekly) for up to two years without any of the problems just mentioned, keep the number (180-age) the same"),
         helpText("  d.  If you have been training for more than two years without any of the problems listed above, and have made progress in competition without injury, add 5."),

         helpText("Initially, training at this relatively low rate may be difficult for some athletes. I just can't train that slowly! is a common comment. But after a short time, you will feel better and your pace will quicken at that same heart rate. You will not be stuck training at that relatively slow pace for too long. Still, for many athletes it is difficult to change bad habits."),
         helpText("If it is difficult to decide which of two groups best fits you, choose the group or outcome that results in the lower heart rate. In athletes who are taking medication that may affect their heart rate, wear a pacemaker, or have special circumstances not discussed here, further consultation with a healthcare practitioner or specialist may be necessary, particularly one familiar with the 180 Formula."),
         
         h3("Source"),
         
         p("http://philmaffetone.com/180-formula/")
),
tabPanel("Analysis",
  fluidPage(
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
        h4('Which resulted in the following maximum aerobic heart rate (in beats per minute'),
        verbatimTextOutput("heartrate")
    )
  )
)
)
)
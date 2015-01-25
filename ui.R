# This is the user-interface definition of the Framingham Risk Score Calculator.
# It calculates the Framingham Risk Score, a sex-specific algorithm used 
# to estimate the 10-year cardiovascular risk of an individual.
# 
# Andrey Kuznetsov, Jan 2015
#-------------------------------------------------------------------------------------------------
library(shiny)
#-------------------------------------------------------------------------------------------------
shinyUI(
    
    pageWithSidebar(
        
        headerPanel('Framingham Risk Score Calculator'),
        
        sidebarPanel(
            
            h4('Please select the following information:'),
            br(),
            h4('About you'),
            selectInput('AgeSelect', 'Age:', 
                        choices = list(
                            '20–34 years' = 1,
                            '35–39 years' = 2,
                            '40–44 years' = 3,
                            '45–49 years' = 4,
                            '50–54 years' = 5,
                            '55–59 years' = 6,
                            '60–64 years' = 7,
                            '65–69 years' = 8,
                            '70–74 years' = 9,
                            '75–79 years' = 10
                            ), selected = 1),
            radioButtons('SexRadioGroup', 'Gender:', 
                         choices = list(
                             'Male',
                             'Female'
                             ), selected = 'Female'),
            br(),
            h4('Clinical information'),
            selectInput('SmokeSelect', 'Smoking status:',
                        choices = list(
                            'Smoker' = 1,
                            'Non-smoker' = 2
                            ), selected = 1),
            p('Systolic blood pressure:'),
            radioButtons('SBPRadioGroup', 'Treated',
                         choices = list('Yes', 'No'), selected = 'Yes', T),
            selectInput('SBPSelect', 'Value, mm Hg',
                        choices = list(
                            'Under 120' = 1,
                            '120-129' = 2,
                            '130-139' = 3,
                            '140-159' = 4,
                            '160 or higher' = 5
                            ), selected = 2
                        ),
            br(),
            h4('Laboratory findings'),
            selectInput('TotCholSelect', 'Total cholesterol, mg/dL',
                        choices = list(
                            'Under 160' = 1,
                            '160-199' = 2,
                            '200-239' = 3,
                            '240-279' = 4,
                            '280 or higher' = 5
                            ), selected = 2),
            selectInput('HDLCholSelect', 'HDL cholesterol, mg/dL',
                        choices = list(
                            '60 or higher' = 1,
                            '50-59' = 2,
                            '40-49' = 3,
                            'Under 40' = 4
                        ), selected = 2),
            actionButton('RiskButton', 'Calculate risk')
            
            ), # sidebarPanel
        
        mainPanel(
            
            p('The Framingham Risk Score is a sex-specific algorithm used to estimate the 10-year cardiovascular risk of an individual, i.e. chances of developing cardiovascular disease.'),
            p('Coronary heart disease (CHD) risk at 10 years in percent can be calculated with the help of the Framingham Risk Score.'),
            p('Individuals with low risk have 10% or less CHD risk at 10 years, with intermediate risk 10-20%, and with high risk 20% or more.'),
            br(),
            h3('Framingham Risk Score:'),
            h4('Risk points:'),
            textOutput('PointsOutput'),
            br(),
            h4('10-year risk in %:'),
            textOutput('RiskOutput')
            ) # mainPanel
        
        ) # pageWithSidebar
    
    ) # shinyUI
#-------------------------------------------------------------------------------------------------
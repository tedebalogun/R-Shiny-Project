## ui.R ##
library(shinydashboard)


#Create UI Dashboard
shinyUI(
  dashboardPage(
    skin='blue',
    dashboardHeader(title="Arrival Flight Delays in LAS Vegas "),
    
    #Create dashboard side bar
    dashboardSidebar(
      sidebarUserPanel("ROBERT RW"),
      sidebarMenu(
        
        menuItem('Reasons of Delay', 
                 tabName='Reason_by_month', 
                 icon=icon("chart-bar")),
        menuItem('Reasons of Delay',
                 tabName="Reason-by-day", icon=icon("chart-bar")),
        menuItem('Data', tabName="Data", icon=icon('table')) 
        
      ) #end of sidebarMenu
    ), #end of dashboardSidebar
    
    
    
    dashboardBody(
      tabItems(
        
        # Tab for Reason of Delay
        
        
        tabItem(
          tabName='Reason_by_month',
          # fluidRow(
          column(
            width=9,
            box(
              title='Delay Reason by Airline Analysis',
              solidHeader = T,
              status='info',
              plotlyOutput('Reason_month_dodged'),
              width=NULL,
              height='auto'
            )#end of box
          ),#end of column
          
          column(
            width=3,
            box(
              title='Select Airline code',
              solidHeader=T,
              width=NULL,
              height='auto',
              status='info',
              checkboxGroupInput(inputId='carrier_code', #server input 
                                 label="Select Airline Code",
                                 choices=unique(Delayed_Vegas$carrier_code),
                                 selected='AA')
            ) #end of box
          ), #end of column
          
          column(
            width=9,
            box(
              title='Delay Reason by Airline Analysis ',
              solidHeader = T,
              status='info',
              plotlyOutput('Reason_month_dodged_city'),
              width=NULL,
              height='auto'
            )#end of box
          ),#end of column
          
          column(
            width=3,
            box(
              title='Select Origin Airport',
              solidHeader = T,
              width=NULL,
              status='info',
              selectizeInput(
                inputId='origin_airport',
                label=NULL,
                choices=unique(Delayed_Vegas$origin_airport ),
                
                
              )
            )#end of box
          ), #end of column
          # Tab for Reason of Delay
          
          tabItem(
            tabName='Reason_by_weekday',
            fluidRow(
              column(
                width=9,
                box(
                  title='Delay Reason by Airline Analysis',
                  solidHeader = T,
                  status='info',
                  plotlyOutput('Reason_day_dodged'),
                  width=NULL,
                  height='auto'
                )#end of box
              ),#end of column
              
              column(
                width=3,
                box(
                  title='Select Airlines',
                  solidHeader=T,
                  width=NULL,
                  height='auto',
                  status='info',
                  checkboxGroupInput(inputId='carrier_code', #server input 
                                     label="Select Airline Code",
                                     choices=unique(Delayed_Vegas$carrier_code),
                                     selected='AA')
                ) #end of box
              ), #end of column
              
              column(
                width=9,
                box(
                  title='Delay Reason by Airline Analysis ',
                  solidHeader = T,
                  status='info',
                  plotlyOutput('Reason_day_dodged_city'),
                  width=NULL,
                  height='auto'
                )#box
              ),#end of column
              
              column(
                width=3,
                box(
                  title='Select Origin Airport',
                  solidHeader = T,
                  width=NULL,
                  status='info',
                  selectizeInput(
                    inputId='origin_airport',
                    label=NULL,
                    choices=unique(Delayed_Vegas$origin_airport )
                    
                  )
                ) #end of box
              ), #end of column
              
              column(
                width=12,
                div(
                  h5('Carrier Delay: Delay caused by carrier such as aircraft cleaning, aircraft damage and baggage loading.'),
                  h5('Late Aircraft Delay: Delay caused by previous aircraft arrived late.'),
                  h5('NAS Delay: Delay caused by national aviation system.'),
                  h5('Security Delay: Delay due security such as evacuation of termination and re-boarding due to security breach.'),
                  h5('Weather Delay: Delay due to weather condition.')
                )# end div
              )
            )#end of fluidRow
          ),#end of Delay Reason Tab
          
          
          #Tab--Data Table
          tabItem(
            tabName = 'Data',
            fluidRow(
              column(
                width=12,
                box(
                  title='Cleaned Data',
                  solidHeader = T,
                  status = 'info',
                  width = NULL,
                  height='auto',
                  DT::dataTableOutput('data_table')  
                )
              )
              
            )#end of fluidRow
          )# end of tab item
          
          
          
          
          
        )#end of tab Items
      ) #end of dashboard Body
    )
    
    
  ) #end of dashboard page
)# end of UI


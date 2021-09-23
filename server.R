## server.R ##
shinyServer(function(input, output){
  
  
  #tab output reason by month, dodge bar chart, select airline
  output$Reason_month_dodged=renderPlotly({
    gathered_delay %>% 
      filter(., carrier_code  %in% input$carrier_code) %>% 
      group_by(., Reason,month) %>% 
      summarise(., delay_Hours=round(mean(delay_Hours),digits=1)) %>% 
      ggplot(aes(x = month, y =delay_Hours)) + 
      geom_bar(stat = 'identity',aes(fill = Reason), position='dodge')+
      ggtitle(" LAS Vegas Average delay Hours per Flight")+ylab('Average Delay Hours per Flight')
  }) #end ouput
  
  #tab output reason by month, dodge bar chart-select airport
  output$Reason_month_dodged_city=renderPlotly({
    gathered_delay %>% 
      filter(., origin_airport  %in% input$origin_airport) %>% 
      group_by(., Reason,month) %>% 
      summarise(., delay_Hours=round(mean(delay_Hours),digits=1)) %>% 
      ggplot(aes(x = month, y =delay_Hours)) + 
      geom_bar(stat = 'identity',aes(fill = Reason), position='dodge')+
      ggtitle(" LAS Vegas Average delay Hours per Flight")+ylab('Average Delay Hours per Flight')
  }) #end ouput
  #tab output reason by month, dodge bar chart, select airline
  output$Reason_day_dodged=renderPlotly({
    gathered_delay %>% 
      filter(., carrier_code  %in% input$carrier_code) %>% 
      group_by(., Reason,day) %>% 
      summarise(., delay_Hours=round(mean(delay_Hours),digits=1)) %>% 
      ggplot(aes(x = day, y =delay_Hours)) + 
      geom_bar(stat = 'identity',aes(fill = Reason), position='dodge')+
      ggtitle(" LAS Vegas Average delay Hours per Flight")+ylab('Average Delay Hours per Flight')
  }) #end ouput
  
  #tab output reason by month, dodge bar chart-select airport
  output$Reason_day_dodged_city=renderPlotly({
    gathered_delay %>% 
      filter(., origin_airport  %in% input$origin_airport) %>% 
      group_by(., Reason,day) %>% 
      summarise(., delay_Hours=round(mean(delay_Hours),digits=1)) %>% 
      ggplot(aes(x = day, y =delay_Hours)) + 
      geom_bar(stat = 'identity',aes(fill = Reason), position='dodge')+
      ggtitle(" LAS Vegas Average delay Hours per Flight")+ylab('Average Delay Hours per Flight')
  }) #end ouput
  
  
  
  #output data table
  output$data_table=renderDataTable(datatable({
    data=Delayed_Vegas %>% 
      select(.,origin_airport ,carrier_code,scheduled_arrival_time ,actual_arrival_time,tail_number,delay_carrier_minutes ,
             arrival_delay_minutes ,delay_carrier_minutes,delay_weather_minutes ,delay_national_aviation_system_minutes,
             delay_security_minutes,delay_late_aircraft_arrival_minutes,month,day)
    data
  }))
  
})#end of shinyServer


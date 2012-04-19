module ApplicationHelper
  def table_row(attribute_name,value)
    result = "<tr><th style='text-align:right'>#{attribute_name}</th><td>#{value}</td></tr>"
    result.html_safe
  end
  
  def status_badge(employment)
    if employment.current?
      result = "<span class='label label-success'>Current</span>"
    else
      result = "<span class='label label-important'>Past</span>"
    end
    result.html_safe
  end
  
  def show_min_pay_rate(position)
    result = "#{position.min_pay}" + "/" + Position.pay_unit_for(position.pay_cadence)
    
    result
  end
  
  def show_max_pay_rate(position)
    result = "#{position.max_pay}" + "/" + Position.pay_unit_for(position.pay_cadence)
    
    result
  end
  
end

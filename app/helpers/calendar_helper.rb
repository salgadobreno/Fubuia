# -*- coding: utf-8 -*-
module CalendarHelper
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
  end

  def proximo_dia_link
    link_to ">>", {:shift => @shift + 1}, :title => "Ver próximos"
  end

  def dia_anterior_link
    link_to "<<", {:shift => @shift - 1}, :title => "Ver anteriores"
  end

  # custom options for this calendar
  def event_calendar_opts
    {
      :shift => @shift,
      :first_day_of_week => @first_day_of_week,
      :height => 114,
      :year => @year,
      :month => @month,
      :event_strips => @event_strips,
      :previous_month_text => dia_anterior_link,
      :next_month_text => proximo_dia_link
      #:month_name_text => I18n.localize(@shown_month, :format => "%B %Y"),
      #:previous_month_text => "<< " + month_link(@shown_month.prev_month),
      #:next_month_text => month_link(@shown_month.next_month) + " >>"    }
    }
  end

  def event_calendar
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts do |args|
      event = args[:event]
      %(<a href="/events/#{event.to_param}" title="#{h(event.name)}">#{h(event.name)}</a>)
    end
  end
end

# -*- coding: utf-8 -*-
module CalendarHelper
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
  end

  def proximo_dia_link
    #link_to ">>", {:shift => @shift + 1}, :title => "Ver próximos"
    link_to({:shift => @shift + 1}, id:"right-arrow", class:"nav-links", remote:true) do
      image_tag "/assets/right-arrow.png", :style => "position: absolute; z-index: 999; right: 0%; top: 50%; height: 30px; opacity: 0.5; margin-right: -10px;"
    end
  end

  def dia_anterior_link
    #link_to "<<", {:shift => @shift - 1}, :title => "Ver anteriores"
    link_to({:shift => @shift - 1}, id:"left-arrow", class:"nav-links", remote:true) do
      image_tag "/assets/left-arrow.png", :style => "position: absolute; z-index: 999; left: 0%; top: 50%; height: 30px; opacity: 0.5; margin-left: -10px;"
    end
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
      :next_month_text => proximo_dia_link,
      :month_name_text => @shift.to_i == 0 ? "<span style='color:white;text-shadow:0 1px 0 black;'>Hoje &darr;</span>" : ""
      #:previous_month_text => "<< " + month_link(@shown_month.prev_month),
      #:next_month_text => month_link(@shown_month.next_month) + " >>"    }
    }
  end

  def event_calendar
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts do |args|
      event = args[:event]
      #TODO: fix messy html in here, use helper
      r = %(<a class="e-sesamo" itemprop="url" href="/#!/events/#{event.to_param}" title="#{h(event.name)}">)
      r << %(<span itemprop="summary"> #{h(event.name)} </span>)
      r << %(</a>)
      r << %(<meta itemprop="startDate" content="#{event.start_at.iso8601}"/>) # Microformats!
      r
    end
  end

  private

  def link_to_hashbang(*args, &block)
    link = link_to(*args, &block)
    "#!#{link}"
  end
end

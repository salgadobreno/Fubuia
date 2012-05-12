module ApplicationHelper

  def flash_messages
    flash.collect do |key, msg|
      content_tag(:div, :id => key, :class => "alert alert-#{key}") do
        content_tag(:a, 'x', :class => "close", :data => {:dismiss => "alert"}) +
        msg
      end
    end.join.html_safe
  end

  def tag_span(tag)
    if tag.kind_of?(Tag)
      css_class = "label"
      css_class << " label-#{tag.css_class}" if tag.css
      content_tag(:span, :class => css_class) do
        tag.name
      end.html_safe
    end
  end

end

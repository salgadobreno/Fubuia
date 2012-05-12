module TagExtensions

  def css_class
    if self.css
      self.name.downcase.gsub(' ', '-')
    elsif self.parent.present?
      self.parent.css_class
    else
      nil
    end
  end

end

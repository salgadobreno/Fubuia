class ActiveRecord::Base
  def self.most_recent_updated_at
    select("updated_at").order("updated_at DESC").limit(1).first.try(:updated_at)
  end

  def self.most_recent_created_at
    select("created_at").order("created_at DESC").limit(1).first.try(:created_at)
  end
end

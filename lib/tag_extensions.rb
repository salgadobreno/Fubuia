# coding: UTF-8
module TagExtensions

  def self.included(base)
    base.class_eval do
      attr_accessible :css
      belongs_to :parent, :class_name => "ActsAsTaggableOn::Tag", :foreign_key => 'parent_id'
      extend ClassMethods
      include InstanceMethods

      default_scope group("tags.id, tags.name")

      scope :join_events, lambda { joins(:taggings).joins("INNER JOIN events ON events.id = taggings.taggable_id").where("taggings.taggable_type = 'Event'") }
      scope :for_date_range, lambda {|start_at, end_at| where([ "taggings.taggable_type = 'Event' AND events.start_at BETWEEN :start_at AND :end_at OR events.end_at BETWEEN :start_at AND :end_at", { :start_at => start_at.at_beginning_of_day, :end_at => end_at.end_of_day } ]) }
      scope :event_tags_for_date_range, lambda { |start_at, end_at| join_events().for_date_range(start_at, end_at)}
      scope :in_city, lambda {|city| where(["events.city_id = ?", city])}
    end
  end

  module ClassMethods
    #Useless right now, currently no use for counts, hard sql, not scoped
    def tag_counts_for_date_range(context, start_at, end_at)
      sql = [ "SELECT tags.*, COUNT(*) AS count FROM tags LEFT OUTER JOIN taggings ON tags.id = taggings.tag_id AND taggings.context = :context INNER JOIN events ON events.id = taggings.taggable_id WHERE taggings.taggable_type = 'Event' AND events.start_at BETWEEN :start_at AND :end_at OR events.end_at BETWEEN :start_at AND :end_at GROUP BY tags.id, tags.name HAVING COUNT(*) > 0", { :context => context, :start_at => start_at.at_beginning_of_day, :end_at => end_at.end_of_day }]
      find_by_sql(sql)
    end
  end

  module InstanceMethods
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

end

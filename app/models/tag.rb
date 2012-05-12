require 'tag_extensions'
class Tag < ActsAsTaggableOn::Tag

  attr_accessible :css

  has_many :events, :through => 'ActsAsTaggableOn::Tagging' # NOTE: bugged
  belongs_to :parent, :class_name => 'Tag', :foreign_key => 'parent_id'

  include TagExtensions


  def self.tag_counts_for_date_range(context, start_at, end_at)
    #sql = ["SELECT tags.*, COUNT(*) AS count FROM tags LEFT OUTER JOIN taggings ON tags.id = taggings.tag_id AND taggings.context = ? INNER JOIN events ON events.id = taggings.taggable_id WHERE taggings.taggable_type = 'Event' AND events.start_at >= ? AND events.end_at < ? GROUP BY tags.id, tags.name HAVING COUNT(*) > 0", context, start_at, ( end_at + 1 )]
    sql = [ "SELECT tags.*, COUNT(*) AS count FROM tags LEFT OUTER JOIN taggings ON tags.id = taggings.tag_id AND taggings.context = :context INNER JOIN events ON events.id = taggings.taggable_id WHERE taggings.taggable_type = 'Event' AND events.start_at BETWEEN :start_at AND :end_at OR events.end_at BETWEEN :start_at AND :end_at GROUP BY tags.id, tags.name HAVING COUNT(*) > 0", { :context => context, :start_at => start_at.at_beginning_of_day, :end_at => end_at.end_of_day }]
    find_by_sql(sql)
  end

end

class Tag < ActiveRecord::Base

  has_many :events, :through => 'ActsAsTaggableOn::Tagging'

  def self.tag_counts_for_date_range(context, start_at, end_at)
    sql = ["SELECT tags.*, COUNT(*) AS count FROM tags LEFT OUTER JOIN taggings ON tags.id = taggings.tag_id AND taggings.context = ? INNER JOIN events ON events.id = taggings.taggable_id WHERE taggings.taggable_type = 'Event' AND events.start_at >= ? AND events.end_at < ? GROUP BY tags.id, tags.name HAVING COUNT(*) > 0", context, start_at, ( end_at + 1 )]
    find_by_sql(sql)
  end

end

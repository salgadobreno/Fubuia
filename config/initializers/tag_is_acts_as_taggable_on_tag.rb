require 'tag_extensions'
ActionDispatch::Callbacks.to_prepare do
  ActsAsTaggableOn::Tag.class_eval do

    include TagExtensions

  end

  ActsAsTaggableOn::Tagging.class_eval do

    default_scope :include => :taggings, :order => 'taggings.id'

  end
end

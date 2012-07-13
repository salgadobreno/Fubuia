require 'tag_extensions'
ActionDispatch::Callbacks.to_prepare do
  ActsAsTaggableOn::Tag.class_eval do

    include TagExtensions

  end
end

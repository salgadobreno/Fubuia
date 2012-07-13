class DefaultsTagCssToTrue < ActiveRecord::Migration
  def up
    change_column :tags, :css, :boolean, :default => true
  end

  def down
    change_column :tags, :css, :boolean, :default => false
  end
end

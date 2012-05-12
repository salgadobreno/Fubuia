class AddCssAndParentIdToTag < ActiveRecord::Migration
  def change
    add_column :tags, :css, :boolean, :default => false
    add_column :tags, :parent_id, :integer
  end
end

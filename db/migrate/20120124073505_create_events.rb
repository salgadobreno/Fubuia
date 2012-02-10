class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.column :fid, 'bigint'
      t.integer :user

      t.timestamps
    end
  end
end

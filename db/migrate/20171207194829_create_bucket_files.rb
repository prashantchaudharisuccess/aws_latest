class CreateBucketFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :bucket_files do |t|
      t.integer :user_id
      t.integer :disk_id
      t.string :name

      t.timestamps
    end
  end
end

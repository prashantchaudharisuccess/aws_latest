class CreateDisks < ActiveRecord::Migration[5.1]
  def change
    create_table :disks do |t|
      t.integer :user_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end

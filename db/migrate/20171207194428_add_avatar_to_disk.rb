class AddAvatarToDisk < ActiveRecord::Migration[5.1]
  def change
    add_column :disks, :avatar, :string
  end
end

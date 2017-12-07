class AddAvatarToBucketFile < ActiveRecord::Migration[5.1]
  def change
    add_column :bucket_files, :avatar, :string
  end
end

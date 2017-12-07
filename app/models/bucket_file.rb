class BucketFile < ApplicationRecord
	mount_uploader :avatar, AvatarUploader
end

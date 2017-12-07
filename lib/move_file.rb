class MoveFile
  def move_file_fun(access_token, aws_secret_access_key, from_bucket, file_name, to_bucket)
    connection = Fog::Storage.new({ :provider => 'AWS', :aws_access_key_id => access_token, :aws_secret_access_key => secret})
    connection.copy_object(from_bucket, file_name, to_bucket, file_name)
  end
end
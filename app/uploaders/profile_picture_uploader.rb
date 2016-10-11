# encoding: utf-8

class ProfilePictureUploader < CarrierWave::Uploader::Base
  if Rails.env.test? || Rails.env.dev?
    storage :file
  else
    storage :fog
  end



  def store_dir
    "/public/uploads/user/profile_picture/#{user.id}/file_name"
  end
end

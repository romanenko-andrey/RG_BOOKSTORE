# :nodoc:
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    'uploads/images'
  end

  def extension_whitelist
    %w(jpg jpeg png)
  end
end

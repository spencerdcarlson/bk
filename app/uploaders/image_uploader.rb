class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  # Image Sizes: 
  #   banner:     940x180
  #   thumbnail:  84x69
  #   default:    530x350
  #   gallery:    200x140
  
  
 
  
  version :banner do
    process :resize_to_limit => [940, 180]
  end
  version :default do
    process :resize_to_limit => [530, 350]
  end
  version :gallery do
    process :resize_to_limit => [200, 140]
  end
  version :thumb do
    process :resize_to_limit => [84, 69]
  end
  
  

end

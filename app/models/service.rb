class Service < ApplicationRecord
  belongs_to :user
  belongs_to :category

  include ImageUploader::Attachment.new(:image)

end
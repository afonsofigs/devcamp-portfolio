class Portfolio < ApplicationRecord
  #Unless these are filled it wont create a post
  validates_presence_of :title, :body, :main_image, :thumb_image
end

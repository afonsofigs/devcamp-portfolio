class Portfolio < ApplicationRecord
  #Unless these are filled it wont create a post
  validates_presence_of :title, :body, :main_image, :thumb_image

  #Custom scope
  def self.angular
      where(subtitle: 'Angular')
  end
  #Custom scope best pratice
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails')}

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "http://via.placeholder.com/600x400"
    self.thumb_image ||= "http://via.placeholder.com/350x200"
  end
end

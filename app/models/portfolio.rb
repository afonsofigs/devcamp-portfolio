class Portfolio < ApplicationRecord
  #Unless these are filled it wont create a post
  validates_presence_of :title, :body, :main_image, :thumb_image

  #Custom scope
  def self.angular
      where(subtitle: 'Angular')
  end
  #Custom scope best pratice
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Ruby on Rails')}
end

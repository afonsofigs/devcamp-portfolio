class Portfolio < ApplicationRecord
  has_many :technologies, dependent: :destroy
  accepts_nested_attributes_for :technologies,
                                 reject_if: lambda  { |attrs| attrs['name'].blank?}
  include Placeholder
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
    self.main_image ||= Placeholder.image_generator(height: '600', width:'400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width:'200')
  end
end

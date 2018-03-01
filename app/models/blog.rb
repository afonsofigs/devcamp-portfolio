class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged

  #Unless these are filled it wont create a post
  validates_presence_of :title, :body
  belogs_to :topic
end
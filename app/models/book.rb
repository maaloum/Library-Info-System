class Book < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  validates_presence_of :title
  validates_presence_of :body
end

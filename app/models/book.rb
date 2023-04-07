class Book < ApplicationRecord
  belongs_to :subject
  validates_presence_of :title
  validates_presence_of :body
  validates_numericality_of :price, :message => "Error Message" 
end

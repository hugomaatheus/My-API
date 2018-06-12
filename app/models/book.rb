class Book < ApplicationRecord
  validates :title, presence: true
  validates :abstract, presence: true

  belongs_to :author

end

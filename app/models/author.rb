class Author < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true

  has_many :books
  has_many :appointments
  has_many :articles, :through => :appointments
end

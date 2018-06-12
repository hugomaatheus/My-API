class Author < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true

  has_many :books, :dependent => :delete_all
  has_many :appointments
  has_many :articles, :through => :appointments, :dependent => :delete_all
end

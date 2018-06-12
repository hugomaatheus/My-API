class Article < ApplicationRecord
  validates :title, presence: true
  validates :abstract, presence: true

  has_many :appointments
  has_many :authors, :through => :appointments, :dependent => :delete_all
end

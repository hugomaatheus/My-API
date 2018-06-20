require 'elasticsearch/model'

class Author < ApplicationRecord
  #ENTIDADE PRINCIPAL
  include Filterable
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  validates :name, presence: true
  validates :age, presence: true

  has_many :books, :dependent => :delete_all
  has_many :citations, :dependent => :delete_all
  has_many :appointments
  has_many :articles, :through => :appointments, :dependent => :delete_all

  scope :by_m_name, -> (name) {where("name like ?", "#{name}%")}

end

class Citation < ApplicationRecord
  validates :m_type, presence: true

  belongs_to :author
end

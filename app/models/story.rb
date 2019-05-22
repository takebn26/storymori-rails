class Story < ApplicationRecord
  has_many :pages

  validates :title, presence: true
  validates :title, length: { maximum: 10 }
  validates :summary, presence: true
end

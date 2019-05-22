class Story < ApplicationRecord
  has_many :pages

  validates :title, presence: true, length: { maximum: 10 }
  validates :summary, presence: true
end

class Story < ApplicationRecord
  has_many :pages, dependent: :destroy

  validates :title, presence: true
  validates :summary, presence: true, length: { maximum: 10 }
end

class Page < ApplicationRecord
  belongs_to :story, optional: true
  has_many :children, class_name: 'Page', foreign_key: :parent_id, dependent: :destroy

  validates :name, presence: true
  validates :text, presence: true
end

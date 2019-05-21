class Page < ApplicationRecord
  belongs_to :story
  has_many :child_pages, class_name: 'Page', foreign_key: :parent_id
end

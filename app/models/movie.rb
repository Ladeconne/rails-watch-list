class Movie < ApplicationRecord
  validates :title, presence: true, uniqueness: true, allow_blank: false
  validates :overview, presence: true, allow_blank: false
  has_many :bookmarks
  has_many :lists, through: :bookmarks
end

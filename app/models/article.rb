class Article < ActiveRecord::Base
  searchkick
  validates :title, presence: true
end

class Article < ActiveRecord::Base
  searchkick
  validates :title, presence: true
  validates :body, length: {maximum: 20000}
end

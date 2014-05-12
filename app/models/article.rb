class Article < ActiveRecord::Base
  include Searchable
  validates :title, presence: true
end

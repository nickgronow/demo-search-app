require 'spec_helper'

describe Article do
  it 'is invalid without a title' do
    article = Article.new
    article.should_not be_valid
  end
end

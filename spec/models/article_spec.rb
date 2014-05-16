require 'spec_helper'

describe Article do
  subject(:article) { Article.new }

  it { should respond_to(:title) }
  
  it { should respond_to(:body) }

  it 'is invalid without a title' do
    should_not be_valid
  end

  it 'should be able to reindex' do
    Article.should respond_to(:reindex)
  end

  it 'should have search functionality' do
    Article.should respond_to(:search)
  end

  it 'should find results with word stemming' do
    article.title = 'Testing word stemming with a word like jumping'
    article.save
    Article.reindex
    results = Article.search 'jumps'
    results.should include(article)
  end
end

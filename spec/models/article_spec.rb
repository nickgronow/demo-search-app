require 'spec_helper'

describe Article do

  it 'is invalid without a title' do
    article = Article.new
    article.should_not be_valid
  end

  it 'should have search functionality' do
    Article.should respond_to(:reindex)
  end

  it 'should have search functionality' do
    Article.should respond_to(:search)
  end

  it 'should find results with word stemming' do
    article = Article.new title: 'Testing word stemming with a word like jumping'
    article.save
    Article.reindex
    results = Article.search 'jumps'
    results.count.should == 1
  end
end

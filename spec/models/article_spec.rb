require 'spec_helper'

describe Article do

  it 'has a title' do
    subject.should respond_to(:title)
  end

  it 'has a body' do
    subject.should respond_to(:body)
  end

  it 'is invalid without a title' do
    subject.should_not be_valid
  end

  it 'should have search functionality' do
    Article.should respond_to(:reindex)
  end

  it 'should have search functionality' do
    Article.should respond_to(:search)
  end

  it 'should find results with word stemming' do
    subject.title = 'Testing word stemming with a word like jumping'
    subject.save
    Article.reindex
    results = Article.search 'jumps'
    results.should include(subject)
  end
end

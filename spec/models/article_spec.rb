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

  context 'with a title' do
    subject!(:article) { Article.create(title:'A Catchy Title') }
    before { Article.reindex }

    it 'should be included in elasticsearch index' do
      Article.search('*').count == 1
    end

    it 'should find results with word stemming' do
      results = Article.search 'catches'
      results.should include(article)
    end
  end
end

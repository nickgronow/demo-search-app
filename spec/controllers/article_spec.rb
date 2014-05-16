require 'spec_helper'

describe ArticlesController do
  describe "GET index" do
    it "assigns @articles" do
      article = Article.create(title: 'My article')
      get :index
      expect(assigns(:articles)).to include(article)
    end
  end

  describe "GET new" do
    it "makes a new article" do
      get :new
      expect(assigns(:article)).to_not be_nil
    end
  end

  describe "POST create" do
    it "Saves a new article" do
      post :create, article: { title: 'My catchy title' }
      Article.all.count.should == 1
    end
  end

  describe "POST results" do
    it "Display results" do
      article = Article.create(title: 'My cool article')
      Article.reindex
      post :results, search: 'cool'
      expect(assigns(:articles)).to include(article)
    end
  end
end

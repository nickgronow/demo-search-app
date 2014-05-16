require 'spec_helper'

describe ArticlesController do
  describe "GET index" do
    it "assigns @articles" do
      article = Article.create(title: 'My article')
      get :index
      expect(assigns(:articles)).to include(article)
    end
  end
end

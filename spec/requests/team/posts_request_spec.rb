require 'rails_helper'

RSpec.describe "Team::Posts", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/team/posts/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/team/posts/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/team/posts/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/team/posts/edit"
      expect(response).to have_http_status(:success)
    end
  end

end

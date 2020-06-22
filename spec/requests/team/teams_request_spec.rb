require 'rails_helper'

RSpec.describe "Team::Teams", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/team/teams/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/team/teams/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/team/teams/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /exit" do
    it "returns http success" do
      get "/team/teams/exit"
      expect(response).to have_http_status(:success)
    end
  end

end

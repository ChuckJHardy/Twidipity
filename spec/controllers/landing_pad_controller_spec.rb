require 'rails_helper'

RSpec.describe LandingPadController, type: :controller do
  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET invite" do
    it "returns http success" do
      get :invite
      expect(response).to have_http_status(:success)
    end
  end
end

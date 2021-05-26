require 'rails_helper'

RSpec.describe "Manager::Categories", type: :request do
  describe "GET manager/categories" do
    it "Success request to manager/categories" do
      get "/manager/categories"
      expect(response).to have_http_status(:ok) 
    end
  end
end

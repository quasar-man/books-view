require 'rails_helper'

RSpec.describe "Managers", type: :request do
  describe "GET /index" do
    it "response returns success" do
      get manager_url
      expect(response.status).to eq 200
    end
  end
end

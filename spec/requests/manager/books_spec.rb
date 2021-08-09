require 'rails_helper'

RSpec.describe "Manager::Books", type: :request do
  describe "GET #index" do
    it "Request should be success" do
      get manager_books_url
      expect(response.status).to eq 200
    end
  end
end

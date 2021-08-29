require 'rails_helper'

RSpec.describe "Manager::Publishers", type: :request do
  let(:publisher) { create(:publisher) }

  describe "GET #index" do
    it "Request should be success" do
      get manager_publishers_url
      expect(response.status).to eq 200
    end

    it "Request to json should be success" do
      get manager_publishers_url(format: :json)
      expect(response.status).to eq 200 
    end
  end

  describe "GET #new" do
    it "Request should be success" do
      get new_manager_publisher_url
      expect(response.status).to eq 200
    end
  end

  describe "POST #create" do
    it "Success creste new record" do
      expect do  
        post manager_publishers_url params: { publisher: FactoryBot.attributes_for(:publisher) }
      end.to change(Publisher, :count).by(1)
    end

    it "Redirect to index" do
      post manager_publishers_url params: { publisher: FactoryBot.attributes_for(:publisher) }
      expect(response).to redirect_to manager_publishers_url
    end
  end

  describe "GET #edit" do
    it "Request should be success" do
      get edit_manager_publisher_url(publisher)
      expect(response.status).to eq 200
    end
  end

  describe "POST #update" do
    it "Success update record" do
      expect do
        put manager_publisher_url(publisher), params: { id: publisher.id, publisher: FactoryBot.attributes_for(:sample_publisher) }
      end.to change { Publisher.find(publisher.id).name }.from(publisher.name).to("Sample Publisher")
    end

    it "Redirect to index" do
      put manager_publisher_url(publisher), params: { id: publisher.id, publisher: FactoryBot.attributes_for(:sample_publisher) }
      expect(response).to redirect_to manager_publishers_url
    end
  end

  describe "POST #destroy" do
    before do
      create(:publisher, id: 100)
    end

    it "Success delete record" do
      expect do
        delete manager_publisher_url(100)
      end.to change(Publisher, :count).by(-1)
    end
  end
end

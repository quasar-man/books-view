require 'rails_helper'

RSpec.describe "Manager::Categories", type: :request do
  let(:category) { create(:category) }

  describe "GET #index" do
    it "Request should be success" do
      get manager_categories_url
      expect(response.status).to eq 200
    end
  end

  describe "GET #new" do
    it "Request should be success" do
      get new_manager_category_url
      expect(response.status).to eq 200
    end
  end

  describe "POST #create" do
    it "Success creste new record" do
      expect do  
        post manager_categories_url params: { category: FactoryBot.attributes_for(:category) }
      end.to change(Category, :count).by(1)
    end

    it "Redirect to index" do
      post manager_categories_url params: { category: FactoryBot.attributes_for(:category) }
      expect(response).to redirect_to manager_categories_url
    end
  end

  describe "GET #edit" do
    it "Request should be success" do
      get edit_manager_category_url(category)
      expect(response.status).to eq 200
    end
  end

  describe "POST #update" do
    it "Success update record" do
      expect do
        put manager_category_url(category), params: { id: category.id, category: FactoryBot.attributes_for(:sample_category) }
      end.to change { Category.find(category.id).name }.from(category.name).to("Sample Category")
    end

    it "Redirect to index" do
      put manager_category_url(category), params: { id: category.id, category: FactoryBot.attributes_for(:sample_category) }
      expect(response).to redirect_to manager_categories_url
    end
  end

  describe "POST #destroy" do
    before do
      create(:category, id: 100)
    end
    it "Success de record" do
      expect do
        delete manager_category_url(100)
      end.to change(Category, :count).by(-1)
    end
  end
end

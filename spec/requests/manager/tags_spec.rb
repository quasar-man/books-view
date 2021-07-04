require 'rails_helper'

RSpec.describe "Manager::Tags", type: :request do
  let(:tag) { create(:tag) }

  describe "GET #index" do
    it "Request should be success" do
      get manager_tags_url
      expect(response.status).to eq 200
    end
  end

  describe "GET #new" do
    it "Request should be success" do
      get new_manager_tag_url
      expect(response.status).to eq 200
    end
  end

  describe "POST #create" do
    it "Success creste new record" do
      expect do  
        post manager_tags_url params: { tag: FactoryBot.attributes_for(:tag) }
      end.to change(Tag, :count).by(1)
    end

    it "Redirect to index" do
      post manager_tags_url params: { tag: FactoryBot.attributes_for(:tag) }
      expect(response).to redirect_to manager_tags_url
    end
  end

  describe "GET #edit" do
    it "Request should be success" do
      get edit_manager_tag_url(tag)
      expect(response.status).to eq 200
    end
  end

  describe "POST #update" do
    it "Success update record" do
      expect do
        put manager_tag_url(tag), params: { id: tag.id, tag: FactoryBot.attributes_for(:sample_tag) }
      end.to change { Tag.find(tag.id).name }.from(tag.name).to("Sample Tag")
    end

    it "Redirect to index" do
      put manager_tag_url(tag), params: { id: tag.id, tag: FactoryBot.attributes_for(:sample_tag) }
      expect(response).to redirect_to manager_tags_url
    end
  end

  describe "POST #destroy" do
    before do
      create(:tag, id: 100)
    end
    it "Success de record" do
      expect do
        delete manager_tag_url(100)
      end.to change(Tag, :count).by(-1)
    end
  end
end

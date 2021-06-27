require 'rails_helper'

RSpec.describe "Manager::Authors", type: :request do
  let(:author) { create(:author) }

  describe "GET #index" do
    it "Request should be success" do
      get manager_authors_url
      expect(response.status).to eq 200
    end
  end

  describe "GET #new" do
    it "Request should be success" do
      get new_manager_author_url
      expect(response.status).to eq 200
    end
  end

  describe "POST #create" do
    it "Success creste new record" do
      expect do  
        post manager_authors_url params: { author: FactoryBot.attributes_for(:author) }
      end.to change(Author, :count).by(1)
    end

    it "Redirect to index" do
      post manager_authors_url params: { author: FactoryBot.attributes_for(:author) }
      expect(response).to redirect_to manager_authors_url
    end
  end

  describe "GET #edit" do
    it "Request should be success" do
      get edit_manager_author_url(author)
      expect(response.status).to eq 200
    end
  end

  describe "POST #update" do
    it "Success update record" do
      expect do
        put manager_author_url(author), params: { id: author.id, author: FactoryBot.attributes_for(:sample_author) }
      end.to change { Author.find(author.id).name }.from(author.name).to("Sample Author")
    end

    it "Redirect to index" do
      put manager_author_url(author), params: { id: author.id, author: FactoryBot.attributes_for(:sample_author) }
      expect(response).to redirect_to manager_authors_url
    end
  end

  describe "POST #destroy" do
    before do
      create(:author, id: 100)
    end
    it "Success de record" do
      expect do
        delete manager_author_url(100)
      end.to change(Author, :count).by(-1)
    end
  end
end

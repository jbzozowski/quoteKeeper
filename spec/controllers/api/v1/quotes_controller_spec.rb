require 'rails_helper'

RSpec.describe Api::V1::QuotesController, type: :controller do

  describe "GET #index" do
    before(:each) do
      4.times { FactoryBot.create :quotes }
      get :index
    end

    it "returns 4 records from the database" do
      quotes_response = json_response
      expect(quotes_response[:quotes]).to have (4).items
    end
    it { should respond_with 200 }
  end
end

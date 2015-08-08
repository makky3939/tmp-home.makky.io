require 'rails_helper'
require 'spec_helper'

RSpec.describe Api::V1::LogsController, type: :controller do
  before(:each) do
    @params = {
      atmosphere: 1000,
      humidity: 32.5,
      temperature: 24.1,
      location: 'makky\'s room'
    }
  end  

  describe "when successful" do
    it "should return 200 OK" do
      expect(response).to be_success
      expect(response.status).to eq 200
    end
    
    it "should create new log" do
      expect{
        post :create, @params
      }.to change(Log, :count).by(1)
    end
  end
end

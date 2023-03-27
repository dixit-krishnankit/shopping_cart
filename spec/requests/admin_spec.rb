require 'rails_helper'

RSpec.describe "Admins", type: :request do
  describe "GET /index" do
    it "Return ok status code" do
      get "/admin"
      expect(response).to have_http_status(200)
    end
  end
end

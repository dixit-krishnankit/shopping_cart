require "rails_helper"

RSpec.describe "Main", type: :request do
  describe "GET /" do
   it "Returns ok status code" do
    get "/"
    expect(response).to have_http_status(200)
   end
  end
end
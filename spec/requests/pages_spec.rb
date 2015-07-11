require 'rails_helper'

RSpec.describe "Pages", type: :request do
  it "Get pages" do
    get pages_path
    expect(response).to have_http_status(200)
  end
  it "Get page" do
    get pages_path
    expect(response).to have_http_status(200)
  end
end

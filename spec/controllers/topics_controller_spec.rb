require 'rails_helper'

describe TopicsController do
  describe 'GET #index' do
    render_views

    it "render the index template" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end

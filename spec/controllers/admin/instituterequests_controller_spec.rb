require 'spec_helper'

describe Admin::InstituterequestsController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

end

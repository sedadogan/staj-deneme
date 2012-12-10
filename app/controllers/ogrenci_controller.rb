class OgrenciController < ApplicationController
  #before_filter :authenticate_user!
  def index
  end
  def content
      email = User.find(current_user.id).email.gsub(/@\w+.[A-z]+.[A-z]{2,4}+.[A-z]{2,4}/,'')
  end
end

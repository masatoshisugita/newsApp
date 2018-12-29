class UsersController < ApplicationController
  def index
    @topics = current_user.topics.all
  end
end

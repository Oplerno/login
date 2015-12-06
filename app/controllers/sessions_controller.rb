class SessionsController < ApplicationController
  def new
    redirect_to '/users/sign_in'
  end
end

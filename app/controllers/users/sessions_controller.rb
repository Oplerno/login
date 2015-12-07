class Users::SessionsController < Devise::SessionsController
  def new
    if params[:redirect_to].present?
      store_location_for(resource, params[:redirect_to])    
    end
    super
  end

  # def create
  #   super
  # end
end

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  Timezone::Configure.begin do |c|
    # TODO: Fill this in with a dedicated Geonames account name
    c.username = 'commonlisp' 
  end
  
  def after_sign_in_path_for(resource)
    session[root_path] || user_user_subscriptions_path(current_user.id)
  end
end

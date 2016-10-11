class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
#add profile_picture to devise whitelist

class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  include SessionsHelper
  include LikesHelper
  include CommentsHelper
  include FriendsHelper
end

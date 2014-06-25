class WelcomeController < ApplicationController
  def index
  	@last = Post.last(5)
  end
end

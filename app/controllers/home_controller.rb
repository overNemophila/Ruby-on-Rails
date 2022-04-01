class HomeController < ApplicationController
  def index
    redirect_to deposits_path
  end
end

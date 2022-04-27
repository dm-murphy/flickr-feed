class StaticPagesController < ApplicationController
  def index
    flickr = Flickr.new
  end
end

class CityController < ApplicationController
  def new
  end

  def show
    @gossip = Gossip.find(params['id'])
  end
end

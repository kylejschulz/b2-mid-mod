class ParksController < ApplicationController

  def show
    @park = Park.find(params[:id])
    @alpha_rides = Park.sort_aplpha
  end
end

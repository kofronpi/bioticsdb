class StrainsController < ApplicationController
  def show
    @strain = Strain.find(params[:id])
  end
end

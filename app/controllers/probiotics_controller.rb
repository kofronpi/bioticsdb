class ProbioticsController < ApplicationController
  def index
    @probiotics = Probiotic.all.order(:name)
  end

  def show
    @probiotic = Probiotic.find(params[:id])
  end
end

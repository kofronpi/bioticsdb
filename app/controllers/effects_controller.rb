class EffectsController < ApplicationController
  def index
    @effects = Effect.all.order(:name)
  end

  def show
    @effect = Effect.find(params[:id])
  end
end

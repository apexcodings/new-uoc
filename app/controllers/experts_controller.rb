class ExpertsController < ApplicationController
  def index
    if params[:category]
      @experts = Expert.where(category: params[:category])
    else
      @experts = Expert.all
    end
  end

  def show
    @expert = Expert.find(params[:id])
  end
end

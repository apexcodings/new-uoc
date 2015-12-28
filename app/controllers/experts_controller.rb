class ExpertsController < ApplicationController
  def index
    if params[:category]
      @experts = Expert.where(category: params[:category])
      @category = Expert::CATEGORIES[params[:category].to_sym]
    else
      @experts = Expert.all
    end
  end

  def show
    @expert = Expert.find(params[:id])
  end
end

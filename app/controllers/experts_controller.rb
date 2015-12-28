class ExpertsController < ApplicationController
  def index
    if params[:category]
      @experts = Expert.where(category: params[:category])
    else
      @experts = Expert.all
    end
  end
end

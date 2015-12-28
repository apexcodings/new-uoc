class ExpertsController < ApplicationController
  def index
    if params[:category]
      case params[:category]
      when "physicians"
        @experts = Expert.where(category: "physicians")
      end
    else
      @experts = Expert.all
    end
  end
end

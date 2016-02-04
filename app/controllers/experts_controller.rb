class ExpertsController < ApplicationController
  def index
    if params[:category]
      @experts = Expert.by_category(params[:category])
      @category = Expert::CATEGORIES[params[:category].to_sym]
    else
      @experts = Expert.all
    end

    render template: "experts/admin_index" if current_user
  end

  def sort
    Expert.all.each do |expert|
      if position = params[:experts].index(expert.id.to_s)
        expert.update_attribute(:position, position + 1) unless expert.position ==  position + 1
      end
    end
    render :nothing => true, :status => 200
  end

  def show
    @expert = Expert.find(params[:id])
    @category = Expert::CATEGORIES[@expert.category.to_sym]
  end

  def edit
    @expert = Expert.find(params[:id])
  end

  def update
    @expert = Expert.find(params[:id])

    if @expert.update_attributes(expert_params)
      redirect_to @expert
    else
      flash[:alert] = "There was an error."
      render :edit
    end
  end

  private

  def expert_params
    params.require(:expert).permit(:first_name, :last_name, :suffix, :phone, :location, :specialty, :procedures, :education, :category, :body, :image_url, :photo )
  end
end

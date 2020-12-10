class TipsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @tips = Tip.all.order("created_at DESC")
  end

  def show
    @tip = Tip.find(params[:id])
  end

  def new
    @tip = Tip.new(user_id: current_user.id)
  end

  def create
    @tip = current_user.tips.build(tip_params)

    if @tip.save
        redirect_to @tip, notice: "Successfully created new Tip"
    else 
        render 'new'
    end 
  end

  def edit
    @tip = Tip.find(params[:id])
    if @tip.edit(tip_params)
        redirect_to @tip, notice: "Tip was Successfully edited!"
    else
        render 'edit'
    end 
  end

  def destroy
    @tip = Tip.find(params[:id])
    @tip.destroy
    redirect_to root_path
  end 

  byebug
  def tip_params
    @tip = Tip.find(params[:id])
    params.require(:tip).permit(:tip_description)
  end
  
end
class TipsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_tip, only: [:show, :edit, :update, :destroy]

  def index
    @tips = Tip.where(user_id: current_user.id).order('created_at DESC')
  end

  def show; end

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

  def edit; end

  def update
    if @tip.update(tip_params)
        redirect_to @tip, notice: "Tip was Successfully edited!"
    else
        render 'edit'
    end 
  end

  def destroy
    @tip.destroy
    redirect_to root_path
  end 

  private

  def tip_params
    params.permit(:tip_description)
  end

  def find_tip
    @tip = Tip.find(params[:id])
  end
  
end
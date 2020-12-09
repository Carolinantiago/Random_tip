class TipsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @tip = Tip.new(user_id: current_user.id)
  end

  def pin_params
    params.require(:tip).permit(:id, :tip_description)
  end
  
end
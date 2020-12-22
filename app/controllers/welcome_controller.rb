class WelcomeController < ApplicationController
  def index
  end

  helper_method :random_tip
  def random_tip
    if Tip.all.any?
      @piqued_tip = Tip.all.sample.tip_description
    else
      @piqued_tip = "No tips for today!"
    end 
  end 
end

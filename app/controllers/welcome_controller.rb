class WelcomeController < ApplicationController
  def index
  end

  helper_method :random_tip
  def random_tip
    @piqued_tip = Tip.all.sample.tip_description
  end 

end

class WelcomeController < ApplicationController
  def index
  end

  helper_method :random_tip
  def random_tip
    @tips = ["Run","Look out the window and you will get it","Eat some ice cream!","Have a coffee!"]

    @piqued_tip = @tips.sample 
  end 

end

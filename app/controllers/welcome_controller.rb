class WelcomeController < ApplicationController
  def index
  end

  helper_method :random_tip
  def random_tip
    #@tips = ["Run","Look out the window and you will get it","Eat some ice cream!","Have a coffee!"," Listen to music!","Hug someone","Try a deep breathing exercise.","Get some natural sunlight!","Get some work done!","Go to the gym on your lunch break."]

    #@piqued_tip = @tips.sample 
    @piqued_tip = Tip.all.sample.tip_description
  end 

end

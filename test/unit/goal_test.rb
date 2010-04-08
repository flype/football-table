require 'test_helper'

class GoalTest < ActiveSupport::TestCase
  context "A goal" do
    setup do
      @match = Factory(:match, :start_time => (Time.now - 2.minute))
    end

    should "don't know who is the pichichi" do
      assert nil, Goal.pichichi
    end
    
    should "know who is the pichichi when a player make a goal" do
      Factory(:goal, :match => @match, :player => @match.white_attacker)
      assert @match.white_attacker, Goal.pichichi
    end

  end  
end

require 'test_helper'

class MatchTest < ActiveSupport::TestCase

  context "A match" do
    setup do
      @match = Factory(:match, :name => "the finnal match", :start_time =>Time.parse("10/2/2010 10:00"), :end_time => Time.parse("10/2/2010 10:10") )
    end

    should "have a name" do
      assert_equal("the finnal match", @match.name)
    end
    
    should "have a white goalkeeper" do
      assert_equal(Player, @match.white_goalkeeper.class)
    end
    
    should "have a red goalkeeper" do
      assert_equal(Player, @match.red_goalkeeper.class)
    end
    
    should "have a white attacker" do
      assert_equal(Player, @match.white_attacker.class)
    end
    
    should "have red attacker" do
      assert_equal(Player, @match.red_attacker.class)
    end
    
    should "have a start time" do
      assert_equal(Time.parse("10/2/2010 10:00"), @match.start_time)
    end
    
    should "have a end time" do
      assert_equal(Time.parse("10/2/2010 10:10"), @match.end_time)
    end
  end
  
  context "A match already started" do
    setup do
      @match = Factory(:match, :start_time => (Time.now - 2.minute))
    end

    should "have a goal from the white team" do
      Factory(:goal, :match => @match, :player => @match.white_attacker)      
      assert_equal(1, @match.goals.count)
    end

    should "have no goals yet" do
      assert_equal("0-0", @match.result)
    end
    
    should "have a goal from the white team in the result" do
      Factory(:goal, :match => @match, :player => @match.white_attacker)      
      assert_equal("1-0", @match.result)
    end
    
    should "have two goals from the white team in the result" do
      Factory(:goal, :match => @match, :player => @match.white_attacker)      
      Factory(:goal, :match => @match, :player => @match.white_attacker)
      assert_equal("2-0", @match.result)
    end

    should "have one goal o each team in the result" do
      Factory(:goal, :match => @match, :player => @match.white_attacker)      
      Factory(:goal, :match => @match, :player => @match.red_attacker)
      assert_equal("1-1", @match.result)
    end

    should "have two goals from the red team, one each player, in the result" do
      Factory(:goal, :match => @match, :player => @match.red_attacker)      
      Factory(:goal, :match => @match, :player => @match.red_goalkeeper)
      assert_equal("0-2", @match.result)
    end
        
    should "have two goals from the white team, one each player, in the result" do
      Factory(:goal, :match => @match, :player => @match.white_attacker)      
      Factory(:goal, :match => @match, :player => @match.white_goalkeeper)
      assert_equal("2-0", @match.result)
    end
  end
  
end

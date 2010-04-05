module HelperMethods
  # Put here any helper method you need to be available in all your acceptance tests
  def create_4_players
    Factory(:player, :name => "Felipe", :email => "felipe.talavera@gmail.com")
    Factory(:player, :name => "Toni",   :email => "toni@gmail.com")
    Factory(:player, :name => "Dani",   :email => "dani@gmail.com")
    Factory(:player, :name => "Oscar",  :email => "oscar@gmail.com")
  end
end

Rspec.configuration.include(HelperMethods)

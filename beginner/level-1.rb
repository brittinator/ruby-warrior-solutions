class Player
  attr_reader :warrior
  
  def play_turn(warrior_object)
    @warrior = warrior_object
    
    warrior.walk!
  end
end
  

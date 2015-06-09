class Player
  attr_reader :warrior, :space
  
  def play_turn(warrior_object)
    @warrior = warrior_object
    @space   = warrior.feel
    
    wat_do
  end
  
  def wat_do
    if space.empty?
      warrior.walk!
    else
      warrior.attack!
    end
  end
end

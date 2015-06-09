class Player
  attr_reader :warrior, :space, :health
  
  def play_turn(warrior_object)
    @warrior = warrior_object
    @space   = warrior.feel
    @health  = warrior.health
    
    # wat_do determines what the appropriate action is for our warrior
    warrior.send wat_do
  end
  
  def wat_do
    action = :walk!
    action = :rest!   if health < 20
    action = :attack! unless space.empty?

    action
  end
end 

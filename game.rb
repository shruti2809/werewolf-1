require_relative 'player_collection'
require_relative 'player'

class Game
  def initialize(no_of_wolves, no_of_villagers)
    @players = PlayerCollection.new
    no_of_wolves.times do
      @players.push(Player.new(true))
    end
    no_of_villagers.times do
      @players.push(Player.new)
    end
  end

  def play
    play_night
  end

private

  def play_night
    announce "It' night time!"
    announce "Everybody slept"
    announce "Wolves wokeup"
    10.times do
      wolves_kill_villager
    end
  end

  def announce(str)
    puts ">> " + str
    # gets
  end

  def wolves_kill_villager
    victim = @players.villagers.alive.sample
    if victim.nil?
      announce "All villagers are dead!"
    else
      victim.kill!
      announce "Wolves killed #{victim.inspect}"
    end
  end
end
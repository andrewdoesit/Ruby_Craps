# lib/bets.rb
# frozen_string_literal: true

require_relative "Craps/version"
require_relative "dice"


# TODO: This is just for the betting. I need to create a class for the bets.
# This class needs to handle all the betting after the roll for point
# It should get user input for the field and come if those bets are not nil
# If they are not nil it should call the field and come methods
# Adding the money to the bank in the Craps.rb file 
# and then updating the bank balance.
# Currently the bets are not working
module Craps
  class Bets
    attr_accessor :field, :come

    def initialize
      @field = 0
      @come = 0
    end

    def field
      # The .sample will randomly select a value from the array
      # @field = [2, 3, 12].sample
      @field = [2, 3, 4, 9, 10, 11]      
    end

    def come
      @come = Dice.new.dice_roll
      puts "You rolled a #{@come} on the come out roll!"
    end
  end
end

if __FILE__ == $0
  bets = Craps::Bets.new
  bets.field
  bets.come
end
end

# lib/bets.rb
# frozen_string_literal: true

require_relative "Craps/version"
require_relative "dice"

module Craps
  class Bets
    attr_accessor :pass_line, :dont_pass, :field, :come

    def initialize
      @pass_line = 0
      @dont_pass = 0
      @field = 0
      @come = 0
    end

    
    def pass_line
      @pass_line = Dice.new.dice_roll
      puts "You rolled a #{@pass_line} on the pass line!"      
    end

    def dont_pass
      @dont_pass = Dice.new.dice_roll
      puts "You rolled a #{@dont_pass} on the dont pass line!"
    end

    def field
      @field = Dice.new.dice_roll
      puts "You rolled a #{@field} on the field!"
    end

    def come
      @come = Dice.new.dice_roll
      puts "You rolled a #{@come} on the come out roll!"
    end

  end
end

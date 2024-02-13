# frozen_string_literal: true

require_relative "Craps/version"

module Craps
  class Game
    attr_accessor :dice_total, :point, :bet, :bank

    def initialize
      @dice_total = dice_total
      @point = point
      @bet = bet
      @bank = 100
    end

    def welcome_banner
      puts """

      ╔═══════════════════════════════════════════════════════╗
      ║ Welcome to the Craps Game!                            ║
      ║                                                       ║
      ║ Enjoy the game and may luck be in your favor!         ║
      ╚═══════════════════════════════════════════════════════╝

"""
    end

    def start_game
      puts "Welcome to Craps!"
      while @bank > 0
        player
        come_out_roll
        while @point
          roll_for_point
        end
        check_continue
      end
      puts "Game over. You have $#{@bank}! Out of money!"
    end

  def player
    puts "How much would you like to bet?\n Pass Line Only!\nYou have $#{@bank}"
    @bet = gets.to_i
    @bank -= @bet
  end

  def roll_dice
    @dice_total = rand(1..6) + rand(1..6)
    puts "You rolled a #{@dice_total}!"
  end

  def come_out_roll
    roll_dice
    case @dice_total
    when 7, 11
      @bank += @bet * 2
      puts "You win! You now have $#{@bank}!"
    when 2, 3, 12
      @bet = nil
      puts "You lose! You now have $#{@bank}!"
    else
      @point = @dice_total
      puts "Your point is #{@point}."
    end
  end

  def roll_for_point
    roll_dice
    if @dice_total == @point
      @bank += @bet * 2
      puts "You hit your point! You win! You now have $#{@bank}!"
      @point = nil
    elsif @dice_total == 7
      puts "You lose! You now have $#{@bank}!"
      @bet = nil
      @point = nil
    else
      puts "Rolling for #{@point} again..."
    end
  end

  def check_continue
    puts "Play again? (y/n)"
    answer = gets.chomp.downcase
    exit unless answer == "y"
  end
end


if __FILE__ == $0
  crap = Craps::Game.new end
  crap.welcome_banner
  crap.start_game
end

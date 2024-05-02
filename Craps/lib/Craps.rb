# frozen_string_literal: true

require_relative "Craps/version"
require_relative "dice"

# Craps/lib/Craps.rb
module Craps
  class Game
    attr_accessor :dice_total, :point, :bet, :bank, :passDontPass

    def initialize
      @dice_total = dice_total
      @point = point
      @bet = bet
      @bank = 100
      @passDontPass = passDontPass
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

    # This function starts the Craps game by welcoming the player,
    # handling player actions, rolls the dice, determines outcomes,
    # and checks if the game should continue based on the bank balance.
    def start_game
      puts "Welcome to Craps!"
      while @bank
        player
        come_out_roll
        # TODO: When rolling for the the point check for user input to place bets
        while @point
          roll_for_point
        end
        check_continue
      end
    end

    # TODO: Write an if statement that checks the user input for the correct answer.
    # if the annswer does not match the correct answer, print an error message and ask the user again. 
  def player
    puts "How much would you like to bet?\nYou have $#{@bank}"
    puts "Enter your bet: Pass Line (1) or Dont Pass Line (2)"
    
    @passDontPass = gets.to_i
    
    puts "Enter your bet: From your Bank: $#{@bank}"
    @bet = gets.to_i
    
    if @passDontPass == 1
      puts "Pass Line Bet"
      @bank -= @bet
    elsif @passDontPass == 2
      @bank -= @bet
    end
  end

  def roll_dice
    @dice_total = Dice.new.dice_roll
    puts "You rolled a #{@dice_total}!"
  end

  # Method to handle the logic of a come out roll in the game. 
  # It checks the @passDontPass value, rolls the dice, and determines the outcome based on the dice total.
  # Adjusts the @bank balance and displays win/loss messages accordingly.
  def come_out_roll
    if @passDontPass == 1
      roll_dice
      case @dice_total
      when 7, 11
        @bank += @bet * 2        
        puts "You win! You now have $#{@bank}!"
        @bet = nil
      when 2, 3, 12
        @bet = nil
        puts "You lose! You now have $#{@bank}!"
      else
        @point = @dice_total
        puts "Your point is #{@point}."
      end

    elsif @passDontPass == 2
        roll_dice
        case @dice_total
      when 7, 11
        @bank -= @bet * 2
        puts "You lose! You now have $#{@bank}!"
        @bet = nil
      when 2, 3, 12
        @bank += @bet * 2
        puts "You win! You now have $#{@bank}!"
        @bet = nil
      else
        @point = @dice_total
        puts "Your point is #{@point}."
      end 
    end
  end

  def roll_for_point
    roll_dice
    if @dice_total == @point
      if @passDontPass == 1
        @bank += @bet * 2
        puts "You hit your point! You win! You now have $#{@bank}!"
        reset
      elsif @passDontPass == 2
        reset
        puts "You hit your point! You lose! You now have $#{@bank}!"
      end
    else
      puts "Rolling for #{@point} again..."
    end
  end

  def reset
    @dice_total = nil
    @point = nil
    @bet = nil
  end

  def check_continue
    # Check if player is out of money and exit if so
    if @bank <= 0
      puts "Game over. You have $#{@bank}! Out of money!"
      exit
    # Then ask if player wants to continue if money is in the Bank
    else
      puts "Play again? (y/n)"
      answer = gets.chomp.downcase
      exit unless answer == "y"
    end
  end
end


if __FILE__ == $0
  crap = Craps::Game.new end
  crap.welcome_banner
  crap.start_game
end


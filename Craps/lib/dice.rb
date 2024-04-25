# lib/dice.rb
# frozen_string_literal: true

require_relative "Craps/version"

module Craps
  class Dice
    attr_accessor :dice_1, :dice_2, :dice_total

    def initialize
      @dice_1 = 0
      @dice_2 = 0
      @dice_total = 0
    end

    def dice_roll
      @dice_1 = rand(1..6)
      @dice_2 = rand(1..6)
      show_art
      @dice_total = @dice_1 + @dice_2
    end

    def show_art
      dice_art1 = case dice_1
      when 1 then die_one
      when 2 then die_two
      when 3 then die_three
      when 4 then die_four
      when 5 then die_five
      when 6 then die_six
      end
      dice_art2 = case dice_2
      when 1 then die_one
      when 2 then die_two
      when 3 then die_three
      when 4 then die_four
      when 5 then die_five
      when 6 then die_six
      end
      dice_art1 = dice_art1.chomp.split("\n")
      dice_art2 = dice_art2.chomp.split("\n")
      dice_art1.zip(dice_art2).each { |line1, line2| puts "#{line1}   #{line2}" }
    end

    def die_one
      dice_art = '''
       -------
      |       |
      |   *   |
      |       |
       -------
      '''
    end

    def die_two
      dice_art = '''
       -------
      |  *    |
      |       |
      |    *  |
       -------
      '''
    end

    def die_three
      dice_art = '''
       -------
      |  *    |
      |   *   |
      |    *  |
       -------
      '''
    end

    def die_four
      dice_art = '''
       -------
      | *   * |
      |       |
      | *   * |
       -------
      '''
    end

    def die_five
      dice_art = '''
       -------
      | *   * |
      |   *   |
      | *   * |
       -------
      '''
    end

    def die_six
      dice_art = '''
       -------
      | *   * |
      | *   * |
      | *   * |
       -------
      '''
    end

    def art
      dice_art1 = die_one.chomp.split("\n")
      dice_art2 = die_two.chomp.split("\n")
      dice_art1.zip(dice_art2).each { |line1, line2| puts "#{line1}   #{line2}" }
    end
  end
end

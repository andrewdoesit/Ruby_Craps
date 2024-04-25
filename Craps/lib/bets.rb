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
      @pass_line = 1
    end

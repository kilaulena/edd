#!/usr/bin/ruby
require 'date'

class EDD
  attr_accessor :now, :edd, :weeks_left, :days_left, :week, :day

  def initialize(year, month, day)
    @now = Date.new(year, month, day)
    @edd = Date.new(2012,6,29)

    difference = edd - now
    @days_left  = (difference % 7).to_i
    @weeks_left = ((difference - @days_left) / 7).to_i

    if @days_left == 0
      @week = 40 - @weeks_left
      @day = 0
    else
      @week = 39 - @weeks_left
      @day = 7 - @days_left
    end
  end

  def show
    puts "Now: #{now.strftime("%D")}, EDD: #{edd.strftime("%D")}"
    puts "Your week changes on #{edd.strftime("%A")}"
    puts "#{weeks_left} weeks, #{days_left} days until EDD"
    puts "#{week}/#{day}, #{week + 1}th week"
  end
end

puts EDD.new.show

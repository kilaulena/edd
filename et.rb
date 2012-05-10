#!/usr/bin/ruby
require 'date'

class ET
  attr_accessor :now, :et, :weeks_left, :days_left, :week, :day

  def initialize(year=Date.today.year, month=Date.today.month, day=Date.today.day)
    @now = Date.new(year, month, day)
    @et = Date.new(2012,6,29)

    difference = et - now
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
    puts "Now: #{now.strftime("%D")}, ET: #{et.strftime("%D")}"
    puts "Your week changes on #{et.strftime("%A")}"
    puts "#{weeks_left} weeks, #{days_left} days until ET"
    puts "#{week}/#{day}, #{week}th week"
  end
end

puts ET.new.show

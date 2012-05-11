#!/usr/bin/ruby
require 'date'

class EDD
  attr_accessor :now, :edd, :weeks_left, :days_left, :week, :day

  def initialize(year, month, day, today=Date.today)
    @now = Date.new(today.year, today.month, today.day)
    @edd = Date.new(year, month, day)

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
end


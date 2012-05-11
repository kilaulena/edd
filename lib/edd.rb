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

    if @now > @edd
      @days_left  = -(7 - @days_left)
      @weeks_left += 1
    end

    if @days_left == 0
      @day = 0
      @week = 40 - @weeks_left
    else
      @day = 7 - @days_left
      @week = 39 - @weeks_left
    end

    if @now > @edd
      @day -= 7
      @week += 1
    end
  end
end


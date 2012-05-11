#!/usr/bin/ruby
require 'date'
require 'test/unit'
require 'edd.rb'

class EDDTest < Test::Unit::TestCase
  def test_midweek
    edd = EDD.new(2012,4,30)

    assert_equal 8,  edd.weeks_left
    assert_equal 4,  edd.days_left
    assert_equal 31, edd.week
    assert_equal 3,  edd.day
  end

  def test_changeday
    edd = EDD.new(2012,5,11)

    assert_equal 7,  edd.weeks_left
    assert_equal 0,  edd.days_left
    assert_equal 33, edd.week
    assert_equal 0,  edd.day
  end
end

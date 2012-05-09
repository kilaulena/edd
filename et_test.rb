#!/usr/bin/ruby
require 'date'
require 'test/unit'
require 'et.rb'

class ETTest < Test::Unit::TestCase
  def test_midweek
    et = ET.new(2012,4,30)

    assert_equal 8,  et.weeks_left
    assert_equal 4,  et.days_left
    assert_equal 31, et.week
    assert_equal 3,  et.day
  end

  def test_changeday
    et = ET.new(2012,5,11)

    assert_equal 7,  et.weeks_left
    assert_equal 0,  et.days_left
    assert_equal 33, et.week
    assert_equal 0,  et.day
  end
end

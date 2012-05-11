#!/usr/bin/ruby
require 'date'
require 'test/unit'
require './lib/edd.rb'

class EDDTest < Test::Unit::TestCase
  def test_start
    edd = EDD.new(2012,6,29, Date.new(2011,9,23))

    assert_equal 0,  edd.days_left
    assert_equal 40, edd.weeks_left
    assert_equal 0,  edd.day
    assert_equal 0,  edd.week
  end

  def test_midweek
    edd = EDD.new(2012,6,29, Date.new(2012,4,30))

    assert_equal 4,  edd.days_left
    assert_equal 8,  edd.weeks_left
    assert_equal 3,  edd.day
    assert_equal 31, edd.week
  end

  def test_before_changeday
    edd = EDD.new(2012,6,29, Date.new(2012,5,10))

    assert_equal 1,  edd.days_left
    assert_equal 7,  edd.weeks_left
    assert_equal 6,  edd.day
    assert_equal 32, edd.week
  end

  def test_changeday
    edd = EDD.new(2012,6,29, Date.new(2012,5,11))

    assert_equal 0,  edd.days_left
    assert_equal 7,  edd.weeks_left
    assert_equal 0,  edd.day
    assert_equal 33, edd.week
  end

  def test_after_changeday
    edd = EDD.new(2012,6,29, Date.new(2012,5,12))

    assert_equal 6,  edd.days_left
    assert_equal 6,  edd.weeks_left
    assert_equal 1,  edd.day
    assert_equal 33, edd.week
  end

  def test_just_before_edd
    edd = EDD.new(2012,6,29, Date.new(2012,6,28))

    assert_equal 1,  edd.days_left
    assert_equal 0,  edd.weeks_left
    assert_equal 6,  edd.day
    assert_equal 39, edd.week
  end

  def test_on_edd
    edd = EDD.new(2012,6,29, Date.new(2012,6,29))

    assert_equal 0,  edd.days_left
    assert_equal 0,  edd.weeks_left
    assert_equal 0,  edd.day
    assert_equal 40, edd.week
  end

  def test_after_edd
    edd = EDD.new(2012,6,29, Date.new(2012,6,30))

    assert_equal -1, edd.days_left
    assert_equal 0,  edd.weeks_left
    assert_equal 1,  edd.day
    assert_equal 40, edd.week
  end

  def test_a_while_after_edd
    edd = EDD.new(2012,6,29, Date.new(2012,7,8))

    assert_equal -2, edd.days_left
    assert_equal -1, edd.weeks_left
    assert_equal 2,  edd.day
    assert_equal 41, edd.week
  end
end

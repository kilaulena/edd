require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require './edd.rb'

get '/' do
  erb :"edd/show", :locals => {:edd => EDD.new}
end
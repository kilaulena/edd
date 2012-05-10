require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require './et.rb'

get '/' do
  erb :"et/show", :locals => {:et => ET.new}
end
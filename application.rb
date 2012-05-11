require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require './lib/edd.rb'

get '/' do
  if present?(params[:year]) && present?(params[:month]) && present?(params[:year])
    erb :"edd/show", :locals => {:edd => EDD.new(params[:year].to_i, params[:month].to_i, params[:day].to_i)}
  else
    erb :"edd/new"
  end
end

def present?(string)
  !string.nil? && string != ""
end

require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require './lib/edd.rb'

get '/' do
  if present?(params[:edd])
    edd = Date.strptime(params[:edd], '%m/%d/%Y')
    if !edd.nil?
      erb :"edd/show", :locals => {:edd => EDD.new(edd)}
    end
  else
    erb :"edd/new"
  end
end

def present?(string)
  !string.nil? && string != ""
end

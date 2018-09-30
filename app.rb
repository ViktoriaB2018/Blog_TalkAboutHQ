#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:talk_about.db"

class Post < ActiveRecord::Base
end

class Comment < ActiveRecord::Base
end

get '/' do
	erb :index			
end

get '/new' do
	erb :new		
end

get '/authors' do
	erb :authors		
end
#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:talk_about.db"

class Post < ActiveRecord::Base
	validates :author, presence: true, length: { minimum: 3 }
	validates :title, presence: true
	validates :content, presence: true
end

class Comment < ActiveRecord::Base
end

get '/' do
	erb :index			
end

get '/new' do
	@p = Post.new
	erb :new		
end

post '/new' do
	@p = Post.new params[:post]
	if @p.save
		erb "<h4>Post was created.</h4>"
	else
		@error = @p.errors.full_messages.first
		erb :new
	end
end

get '/authors' do
	erb :authors		
end
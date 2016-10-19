ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'models/data_mapper_setup'
class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    sausages = Link.new(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(name: params[:tags])
    sausages.tags << tag
    sausages.save
    redirect to('/links')
  end

  get '/tags/:name' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.create(name: tag)
    end
    link.save
    redirect to('/links')
  end

run! if app_file == $0

end

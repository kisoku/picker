require 'rubygems'
require 'compass'
require 'compass-colors'
require 'sinatra'
require 'haml'
require 'susy'

require File.join(File.dirname(__FILE__), 'lib', 'picker')

configure do
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = File.join(Sinatra::Application.views, 'css')
    config.output_style = :compact
  end
end

get '/' do
  haml :index, :layout => false
end

get '/picker/:name' do
  haml :"picker/#{params[:name]}", :layout => false
end

get '/css/:name.css' do
  # ugly but works see picker.rb for the hack
  $PICKER_BASE_COLOR = params['base_color']
  content_type 'text/css', :charset => 'utf-8'
  sass :"css/#{params[:name]}", Compass.sass_engine_options
end

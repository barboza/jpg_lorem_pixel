require 'rubygems'
require 'sinatra'
require 'net/http'

get '/image/:x/:y' do
  uri = URI("http://lorempixel.com/#{params[:x]}/#{params[:y]}/")

  # get only header data
  head = Net::HTTP.start(uri.host, uri.port) do |http|
    http.head(uri.request_uri)
  end

  # set headers accordingly (all that apply)
  headers 'Content-Type' => head['Content-Type']

  # stream back the contents
  stream do |out|
    Net::HTTP.get_response(uri) do |f|
      f.read_body { |ch| out << ch }
    end
  end
end

get '/' do
  "Congradulations!
   You're running a Sinatra application on Heroku!"
end


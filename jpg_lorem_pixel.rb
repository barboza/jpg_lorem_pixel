require 'rubygems'
require 'sinatra'
require 'net/http'
require 'slim'


get '/:type/:x/:y/:format' do
  types = %w{abstract animals business cats city food nightlife fashion people nature sports technics transport}
  if types.include?(params[:type])
  uri = URI("http://lorempixel.com/#{params[:x]}/#{params[:y]}/#{params[:type]}/")
  else
    uri = URI("http://lorempixel.com/#{params[:x]}/#{params[:y]}/")
  end

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
  slim :index
end

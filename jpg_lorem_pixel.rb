require 'rubygems'
require 'sinatra'
require 'net/http'
require 'redcarpet'
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
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :layout_engine => :slim)
  @content = markdown.render(File.read(File.join('readme.md')))
  slim :index
end


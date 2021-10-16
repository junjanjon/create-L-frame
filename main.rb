require 'erb'
require 'optparse'

params = {}
OptionParser.new do |opt|
  opt.on('--input TEMPLATE_FILE') { |v| v }
  opt.on('--output FILE_NAME') { |v| v }
  opt.on('--main_width WIDTH') { |v| v }
  opt.on('--main_height HEIGHT') { |v| v }
  opt.on('--background_color COLOR') { |v| v }
  opt.on('--line_color COLOR') { |v| v }
end.parse!(ARGV, into: params)

WIDTH = 1920
HEIGHT = 1080

def get_params(params)
  width = WIDTH
  height = HEIGHT
  main_width = params[:main_width].to_i
  main_height = params[:main_height].to_i
  sub_width = width - main_width
  sub_height = height - main_height
  background_color = params[:background_color]
  line_color = params[:line_color]
  binding
end

erb = ERB.new(File.read(params[:input]))
File.write(params[:output], erb.result(get_params(params)))

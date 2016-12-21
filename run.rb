require 'gosu'
require 'pry'

Dir.glob './data/levels/*.rb' do |file|
  require file
end

Dir.glob './scripts/*.rb' do |file|
  require file
end

$window = GameWindow.new
$window.show

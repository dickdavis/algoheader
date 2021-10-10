# frozen_string_literal: true

# Copyright 2021 Dick Davis
#
# This file is part of algoheader.
#
# algoheader is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# algoheader is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with algoheader.  If not, see <http://www.gnu.org/licenses/>.

##
# = /lib/algoheader.rb
# Author::    Dick Davis
# Copyright:: Copyright 2021 Dick Davis
# License::   GNU Public License 3
#
# Main application file that loads other files.

require 'algoheader/png_transformer'
require 'algoheader/svg_generator'
require 'algoheader/version'
require 'optparse'
require 'English'

trap('INT') do
  puts "\nTerminating..."
  exit
end

options = {}

optparse = OptionParser.new do |opts|
  opts.banner = 'Usage: algoheader [options]'

  opts.on('-c', '--config FILE', 'Specifies the configuration file to use.') do |config|
    options[:config] = config
  end

  opts.on('-d', '--directory NAME', 'Sets the output directory.') do |dir|
    options[:dir] = dir
  end

  opts.on('-l', '--license', 'Displays the copyright notice') do
    puts "This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
"
  end

  opts.on('-w', '--warranty', 'Displays the warranty statement') do
    puts "This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
"
  end

  opts.on('-v', '--version', 'Displays the program version') do
    puts "algoheader v#{Algoheader::VERSION}"
  end

  opts.on_tail('-h', '--help', 'Displays the help screen') do
    puts opts
    exit
  end
end

begin
  optparse.parse!
rescue OptionParser::InvalidOption, OptionParser::MissingArgument
  puts $ERROR_INFO.to_s
  puts 'Use -h or --help for options.'
  exit 1
end

COLOR_SCHEMES = {
  magnolia: ['rgb(246,238,235)', 'rgb(234,213,207)', 'rgb(200,224,228)', 'rgb(113,151,160)', 'rgb(34,48,83)', 'none', 'white']
}

%i(magnolia).each do |scheme|
  50.times do |index|
    Algoheader::PngTransformer.call(Algoheader::SvgGenerator.call(COLOR_SCHEMES[scheme]), "#{scheme.to_s}_#{index}")
  end
end

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
require 'algoheader/hello'

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

  opts.on('-g', '--greet NAME', 'Provides a greeting given a name.') do |name|
    options[:greet] = name
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

if options[:greet]
  # Displays the greeting which serves as a functional test
  puts Algoheader::Hello.greeting(options[:greet])
end

# NOTE: You should replace the greet functionality with some of your own code.
#       Use the hello.rb file as a guide for structuring your code, and ensure
#       that you adjust the require statement as well as the CLI option (if
#       included), adding additional files/CLI options in a similar fashion.

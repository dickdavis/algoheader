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

module Algoheader
  ##
  # = Helpers
  # Author::    Dick Davis
  # Copyright:: Copyright 2021 Dick Davis
  # License::   GNU Public License 3
  #
  # Module that provides helper methods.
  module Helpers
    def self.config_from_home
      config_dir = (ENV['XDG_CONFIG_HOME'] || Dir.home + '/.config') + '/algoheader'
      FileUtils.mkdir_p(config_dir)

      config_filename = config_dir + '/config.yml'
      unless File.exist?(config_filename)
        config_asset = File.expand_path(File.join(File.dirname(__FILE__), '..', 'assets', 'config.yml'))
        FileUtils.cp(config_asset, config_filename)
      end

      config_filename
    end

    def self.selection_from_user(config, selection = '')
      while selection.empty?
        puts 'Choose a color scheme from the list below:'

        schemes = config['color_schemes'].collect{|scheme| scheme['name'] }
        schemes.each.with_index do |scheme, index|
          puts "#{index}: #{scheme}"
        end

        puts 'Selection => '
        user_input = gets.chomp.to_i
        if (0..schemes.length - 1).include?(user_input)
          selection = config['color_schemes'].select{|scheme| scheme['name'] == schemes[user_input] }
                                             .first
                                             .transform_keys(&:to_sym)
        end
      end

      return selection
    end
  end
end

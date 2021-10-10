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

require 'rmagick'
require_relative 'service_object'

module Algoheader
  ##
  # = PngTransformer
  # Author::    Dick Davis
  # Copyright:: Copyright 2021 Dick Davis
  # License::   GNU Public License 3
  #
  # Service object that writes SVG blobs to PNG files.
  class PngTransformer < ServiceObject
    attr_reader :svg, :filename

    def initialize(svg, filename)
      @svg = svg
      @filename = filename
    end

    def call
      img = Magick::Image.from_blob(svg) do
        self.format = 'SVG'
        self.background_color = 'transparent'
      end
      img[0].write("#{filename}.png")
    end
  end
end

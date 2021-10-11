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

require 'ascii_to_svg'
require_relative 'service_object'

module Algoheader
  ##
  # = SvgGenerator
  # Author::    Dick Davis
  # Copyright:: Copyright 2021 Dick Davis
  # License::   GNU Public License 3
  #
  # Generates SVGs by providing randomized input to algorithm.
  class SvgGenerator < ServiceObject
    SYMBOLS = ['/', '|', "\\", '-', '+', 'x', 'o', "\#", '.']
    WIDTHS = [0.5, 0.75, 1.0, 1.5, 2.0]
    LINECAPS = ['butt', 'round', 'square']
    OPACITIES = [0.5, 0.6, 0.7, 0.8, 0.9, 1.0]

    attr_reader :fill_colors, :stroke_colors

    def initialize(fill_colors:, stroke_colors:)
      @fill_colors = fill_colors
      @stroke_colors = stroke_colors
    end

    def call
      ascii = AsciiToSvg.example_string(random_symbol_sample, 80)
      AsciiToSvg.from_string(ascii, 16, **options)
    rescue ZeroDivisionError
      retry
    end

    private

    def options
      {
        canvas__size__x: 1500,
        style__line__stroke__width: random_width,
        style__line__stroke__color: random_stroke_color,
        style__line__stroke__opacity: random_opacity,
        style__line__stroke__linecap: random_linecap,
        style__ellipse__stroke__width: random_width,
        style__ellipse__stroke__color: random_stroke_color,
        style__ellipse__stroke__opacity: random_opacity,
        style__ellipse__stroke__linecap: random_linecap,
        style__ellipse__fill: random_fill_color,
        style__rectangle__fill__color: random_fill_color,
        style__canvas__fill__color: random_fill_color,
      }
    end

    def random_symbol_sample
      SYMBOLS.sample(rand(SYMBOLS.length))
    end

    def random_width
      WIDTHS.sample
    end

    def random_opacity
      OPACITIES.sample
    end

    def random_linecap
      LINECAPS.sample
    end

    def random_fill_color
      fill_colors.sample
    end

    def random_stroke_color
      stroke_colors.sample
    end
  end
end

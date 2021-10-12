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
    SYMBOLS = ['/', '|', '\\', '-', '+', 'x', 'o', "\#", '.'].freeze
    WIDTHS = [0.75, 1.0, 1.5].freeze
    LINECAPS = %w[butt round square].freeze
    OPACITIES = [0.8, 0.9, 1.0].freeze

    attr_reader :fill_colors, :stroke_colors

    # rubocop:disable Lint/MissingSuper
    def initialize(fill_colors:, stroke_colors:)
      @fill_colors = fill_colors
      @stroke_colors = stroke_colors
    end
    # rubocop:enable Lint/MissingSuper

    def call
      ascii = AsciiToSvg.example_string(random_symbol_sample, 80)
      AsciiToSvg.from_string(ascii, 16, **options)
    rescue ZeroDivisionError
      retry
    end

    private

    def canvas_color
      @canvas_color ||= random_fill_color
    end

    # rubocop:disable Metrics/MethodLength
    def options
      {
        canvas__size__x: 1500,
        style__canvas__fill__color: canvas_color,
        style__line__stroke__width: random_width,
        style__line__stroke__color: random_stroke_color,
        style__line__stroke__opacity: random_opacity,
        style__line__stroke__linecap: random_linecap,
        style__ellipse__stroke__width: random_width,
        style__ellipse__stroke__color: random_stroke_color,
        style__ellipse__stroke__opacity: random_opacity,
        style__ellipse__stroke__linecap: random_linecap,
        style__ellipse__fill: random_fill_color,
        style__rectangle__fill__color: random_fill_color
      }
    end
    # rubocop:enable Metrics/MethodLength

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
      return fill_colors.sample if @canvas_color.nil?

      fill_colors.reject { |color| color == canvas_color }.sample
    end

    def random_stroke_color
      stroke_colors.reject { |color| color == canvas_color }.sample
    end
  end
end

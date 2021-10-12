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

lib = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require File.expand_path('lib/algoheader/version', __dir__)

Gem::Specification.new do |s|
  s.name          = 'algoheader'
  s.version       = Algoheader::VERSION
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Dick Davis']
  s.email         = 'dick@hey.com'
  s.homepage      = 'https://github.com/d3d1rty/algoheader'
  s.summary       = 'Programmatically generate beautiful header images for blogs or social media accounts.'
  s.description   = <<~HEREDOC
    Programmatically generate beautiful header images for blogs or social media accounts.
  HEREDOC
  s.license       = 'GPL-3.0'
  s.files         = Dir['lib/**/*']
  s.executables   = ['algoheader']
  s.test_files    = Dir['test/**/*']
  s.require_path  = ['lib']

  s.required_ruby_version = '>= 3.0'
  s.add_runtime_dependency 'ascii_to_svg', '>=0.1.4'
end

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
  # = ServiceObject
  # Author::    Dick Davis
  # Copyright:: Copyright 2021 Dick Davis
  # License::   GNU Public License 3
  #
  # Superclass for classes using the service object design pattern.
  class ServiceObject
    ##
    # Allows subclasses to be initialized and called at the same time.
    def self.call(*args, &block)
      new(*args, &block).call
    end
  end
end

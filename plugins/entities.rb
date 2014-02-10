# Simple Omega Entity Representations
#
# Copyright (C) 2014 Mo Morsi <mo@morsi.org>
# Licensed under the MIT License

require 'ostruct'

# TODO fill in other json attrs
# (only needed for entities we are serializing
#  to send to server)

class BaseEntity < OpenStruct
  class << self
    def json_attrs(*attrs)
      @json_attrs ||= []
      @json_attrs += attrs
      @json_attrs
    end
  end

  def self.json_create(o)
    new(o['data'])
  end

  def json_attrs
    self.class.json_attrs.inject({}) do |jattrs, k|
      v = self.send k
      jattrs[k] = v
      jattrs
    end
  end

  def to_json(*a)
    {
      'json_class' => self.class.name,
      'data'       => self.json_attrs
    }.to_json(*a)
  end
end

module Users
  class User < BaseEntity
    json_attrs :id, :email, :password
  end

  class Session < BaseEntity
  end

  class Role < BaseEntity
  end

  class Privilege < BaseEntity
  end
end

module Motel
  class Location < BaseEntity
  end

  class MovementStrategy < BaseEntity
  end

  module MovementStrategies
    class Stopped < MovementStrategy
    end

    class Linear < MovementStrategy
    end

    class Elliptical < MovementStrategy
    end

    class Follow < MovementStrategy
    end

    class Rotate < MovementStrategy
    end
  end
end

module Cosmos
module Entities
  class Galaxy < BaseEntity
  end

  class SolarSystem < BaseEntity
  end

  class Star < BaseEntity
  end

  class Planet < BaseEntity
  end

  class Moon < BaseEntity
  end

  class Asteroid < BaseEntity
  end

  class JumpGate < BaseEntity
  end
end

  class Resource < BaseEntity
  end
end

module Manufactured
  class Ship < BaseEntity
  end

  class Station < BaseEntity
  end
end

module Missions
  class Mission < BaseEntity
  end
end

module Stats
  class Stat < BaseEntity
  end

  class StatResult < BaseEntity
  end
end

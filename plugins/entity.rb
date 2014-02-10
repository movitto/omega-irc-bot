# Omega Entity Plugin for Omega IRC Bot
#
# Copyright (C) 2014 Mo Morsi <mo@morsi.org>
# Licensed under the MIT License

class EntityIRC < CommonIRC
  include Cinch::Plugin
  match /entity (.+)/

  def dispatch(query)
    target,value = query.split
    case(target)
    when "stat"
      invoke(['stats::get', value]).value
    when "galaxy", "system"
      invoke(['cosmos::get_entity', 'with_name', value]).id
    when "ship", "station"
      invoke(['manufactured::get_entity', 'with_id', value]).to_s
    # TODO other types
    else
      "Invalid target #{target}"
    end
  end

  def execute(m, query)
    m.reply dispatch(query)
  end
end

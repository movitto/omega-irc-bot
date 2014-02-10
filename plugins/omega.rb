# Omega Invokation Plugin for Omega IRC Bot
#
# Copyright (C) 2014 Mo Morsi <mo@morsi.org>
# Licensed under the MIT License

class OmegaIRC < CommonIRC
  include Cinch::Plugin
  match /omega (.+)/

  def execute(m, query)
    m.reply invoke(query.split)
  end
end

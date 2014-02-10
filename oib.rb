# The Omega IRC Bot
#
# Copyright (C) 2014 Mo Morsi <mo@morsi.org>
# Licensed under the MIT License

require 'cinch'

require 'plugins/common'
require 'plugins/omega'
require 'plugins/entity'
require 'plugins/git'

bot = Cinch::Bot.new do
  configure do |c|
    c.server   = "irc.freenode.org"
    c.nick     = "omega-bot"
    c.channels = ["#omegaverse-test"]
    c.plugins.plugins = [EntityIRC, OmegaIRC, GitHubIRC]
  end
end

bot.start

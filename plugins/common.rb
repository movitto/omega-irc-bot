# Common Modules of Omega IRC Bot Plugins
#
# Copyright (C) 2014 Mo Morsi <mo@morsi.org>
# Licensed under the MIT License

require 'rjr/nodes/tcp'

require 'plugins/entities'

class CommonIRC
  # TODO allow clients to specify host via irc msg
  HOST     = 'omegaverse.info'
  PORT     = 8181
  USERNAME = 'anon'
  PASSWORD = 'nona'

  def dst
    @dst ||= "tcp://#{HOST}:#{PORT}"
  end

  def user
    @user ||= Users::User.new(:id => USERNAME, :password => PASSWORD)
  end

  def rjr
    @rjr ||=
      begin
        rjr = RJR::Nodes::TCP.new :node_id => "oib"
        session = rjr.invoke dst, 'users::login', user
        rjr.message_headers['session_id'] = session.id
        rjr
      end
  end

  def invoke(query)
    r = nil
    begin
      r = rjr.invoke dst, *query
    rescue => e
      r = e
    end
    r
  end

end

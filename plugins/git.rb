# Git Plugin for Omega IRC Bot
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
class GitHubIRC
  include Cinch::Plugin
  match /git (.+)/

  PROJECT = 'movitto/omega'
  def base_url
    "http://github.com/#{PROJECT}"
  end

  def dir_url(dir)
    "#{base_url}/tree/master/#{dir}"
  end

  def file_url(file)
    "#{base_url}/blob/master/#{file}"
  end

  def commit_url(commit)
    "#{base_url}/commit/#{commit}"
  end

  def dispatch(query)
    target,value = query.split
    case(target)
    when "dir"
      dir_url value
    when "file"
      file_url value
    when "commit"
      commit_url value
    else
      "Invalid #{target} - must be 'dir', 'file', or 'commit'"
    end
  end

  def execute(m, query)
    m.reply dispatch(query)
  end
end

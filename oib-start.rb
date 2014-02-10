#!/usr/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
/usr/bin/nohup ruby -I. $DIR/oib.rb &

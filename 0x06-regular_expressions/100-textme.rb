#!/usr/bin/env ruby
puts ARGV[0].scan(/from:(\w+|\+?\d{11})[^.]+to:(\w+|\+?\d{11})[^.]+flags:([\d,\W]+)\]/).join(',')

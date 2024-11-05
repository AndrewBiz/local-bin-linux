#!/usr/bin/env ruby
# frozen_string_literal: true
# encoding: UTF-8
# (c) ANB Andrew Bizyaev

require 'rubygems'
require 'mini_exiftool'

if ARGV.empty?
  puts "usage: #{__FILE__} FILES"
  puts " i.e.: #{__FILE__} *.jpg"
  exit(-1)
end

puts
puts 'Full dump of tags using mini_exiftool gem'

# Loop at all given files
ARGV.each do |filename|
  # If a given file isn't a photo MiniExiftool new method will throw
  # an exception this we will catch
  begin
    tags_composite = MiniExiftool.new(
      filename,
      numerical: false,
      coord_format: '%d %d %.4f',
      replace_invalid_chars: true,
      composite: true,
      timestamps: DateTime
    )
    tags_simple = MiniExiftool.new(
      filename,
      numerical: false,
      coord_format: '%d %d %.4f',
      replace_invalid_chars: true,
      composite: false,
      timestamps: DateTime
    )
  rescue MiniExiftool::Error => e
    $stderr.puts e.message
  end

  puts "***** FILE: #{filename} *****"
  keys_all = (tags_composite.to_hash.keys + tags_simple.to_hash.keys).compact.uniq.sort
  puts '*******************************************************************************************'
  puts 'TAG_NAME                   DIFF COMPOSITE_VALUE                                SIMPLE_VALUE'
  tags_composite_hash = tags_composite.to_hash
  tags_simple_hash = tags_simple.to_hash

  puts format(
    '%-26s %-4d %-46d %d',
    '_number of tags_',
    tags_composite_hash.size - tags_simple_hash.size,
    tags_composite_hash.size,
    tags_simple_hash.size
  )

  keys_all.each do |key|
    print format('%-29s ', key)
    val_composite = tags_composite_hash[key]
    val_simple = tags_simple_hash[key]
    diff = val_composite == val_simple ? ' ' : '!'
    print format('%s ', diff)
    print format('%-10s %-35s ', "(#{val_composite.class})", val_composite)
    print format('%-10s %-35s ', "(#{val_simple.class})", val_simple)
    puts
  end

  # puts '*** COMPOSITE TAGS ***'
  # puts tags_composite.to_hash.size
  # tags_composite.to_hash.each do |t, v|
  #   puts format('%-29s %-10s %s', t, "(#{v.class})", v)
  # end
  # puts
  #
  # puts '*** SIMPLE TAGS ***'
  # puts tags_simple.to_hash.size
  # tags_simple.to_hash.each do |t, v|
  #   puts format('%-29s %-10s %s', t, "(#{v.class})", v)
  # end
  # puts
end

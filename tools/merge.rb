#!/usr/bin/ruby

# merges the contents of N files to an out file
# usage: ./merge.rb out file1 ... fileN

lines = []
N = ARGV.length
out_file = ARGV[0]

comment = "#"

ARGV[1..N].each_with_index { |a, i|
    header = ["\n\n" * (i == 0 ? 0 : 1) + comment * 3 + " #{a.split('/')[-1]}\n\n"]
    lines += header + File.foreach(a).to_a.map {|l| l.strip}
}

lines = lines.uniq

open(out_file, 'w') { |f| lines.each {|l| f.puts(l)} }

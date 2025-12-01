# frozen_string_literal: true

require_relative 'helpers/file_reader'

# Advent of Code main module
module Aoc
  ROOT = File.expand_path('..', __dir__)

  def self.run(day, input_type = 'input')
    day_str = format('day%02d', day)
    day_dir = File.join(ROOT, 'days', day_str)
    solution_file = File.join(day_dir, 'solution.rb')

    abort "Solution file not found for #{day_str} at #{solution_file}" unless File.exist?(solution_file)

    require solution_file

    klass_name = 'Day%02d' % day
    abort "Expected class #{klass_name} to be defined in #{solution_file}" unless Object.const_defined?(klass_name)

    klass = Object.const_get(klass_name)

    input_path = File.join(day_dir, "#{input_type}.txt")
    raw_input  = Helpers::FileReader.read(input_path)

    solver = klass.new(raw_input)

    puts "== #{day_str} =="
    puts "Input: #{input_type}"
    puts "Part 1: #{solver.part1}"
    puts "Part 2: #{solver.part2}"
  end
end

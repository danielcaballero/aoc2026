# frozen_string_literal: true

class Day01
  BOARD_SIZE = 100
  START_POSITION = 50
  def initialize(raw_input)
    @moves = raw_input.split("\n")
  end

  def part1
    total_zero_hits, =
      @moves.reduce([0, START_POSITION]) do |(total_zero_hits, position), move|
        new_position = calculate_new_position(move, position)
        [total_zero_hits + (new_position.zero? ? 1 : 0), new_position]
      end

    total_zero_hits
  end

  def part2
    @moves.reduce([0, START_POSITION]) do |(total_zero_hits, pos), move|
      hits, new_pos = calculate_zero_hits_and_new_position(move, pos)
      [total_zero_hits + hits, new_pos]
    end.first
  end

  private

  def calculate_new_position(move, position)
    direction = move[0]
    number = move[1..-1].to_i
    case direction
    when 'L'
      (position - number) % BOARD_SIZE
    when 'R'
      (position + number) % BOARD_SIZE
    end
  end

  def calculate_zero_hits_and_new_position(move, position)
    direction = move[0]
    steps = move[1..-1].to_i

    new_position =
      case direction
      when 'R' then (position + steps) % BOARD_SIZE
      when 'L' then (position - steps) % BOARD_SIZE
      else
        raise "unknown direction #{direction.inspect}"
      end

    zero_hits =
      case direction
      when 'R'
        offset = (BOARD_SIZE - position) % BOARD_SIZE
        first_hit = offset.zero? ? BOARD_SIZE : offset
        if steps < first_hit
          0
        else
          1 + (steps - first_hit) / BOARD_SIZE
        end
      when 'L'
        offset = position % BOARD_SIZE
        first_hit = offset.zero? ? BOARD_SIZE : offset
        if steps < first_hit
          0
        else
          1 + (steps - first_hit) / BOARD_SIZE
        end
      end

    [zero_hits, new_position]
  end
end

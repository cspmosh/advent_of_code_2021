class SeaFloor
  attr_reader :region

  def initialize
    @region = []
  end

  def add_cucumbers(cucumbers)
    @region << cucumbers.split("")
  end

  def to_s
    region.each do |row|
      puts row.join
    end
  end

  def move_cucumbers
    moves_east = move_cucumbers_east
    moves_south = move_cucumbers_south

    moves_east.positive? || moves_south.positive?
  end

  def continuously_move_cucumbers
    count = 1

    # puts "Initial state:"
    # puts self

    while (move_cucumbers)
      # puts ""
      # puts "After #{count} step:"
      # puts self

      count += 1
    end

    # puts ""
    # puts "After #{count} step:"
    # puts self

    count
  end

  private

  def move_cucumbers_east
    swap_stack = []

    region.each_with_index do |cucumbers, row|
      cucumbers.each_with_index do |cucumber, column|
        next_column = (column + 1) % cucumbers.length

        if region[row][column] == ">" && region[row][next_column] == '.'
          swap_stack << [row, column, next_column]
        end
      end
    end

    swap_stack.each do |set|
      swap_columns(row: set[0], column_1: set[1], column_2: set[2])
    end

    swap_stack.size
  end

  def move_cucumbers_south
    swap_stack = []

    region.each_with_index do |cucumbers, row|
      next_row = (row + 1) % region.length

      cucumbers.each_with_index do |cucumber, column|
        if region[row][column] == "v" && region[next_row][column] == '.'
          swap_stack << [column, row, next_row]
        end
      end
    end

    swap_stack.each do |set|
      swap_rows(column: set[0], row_1: set[1], row_2: set[2])
    end

    swap_stack.size
  end

  def swap_columns(row:, column_1:, column_2:)
    region[row][column_1], region[row][column_2] = region[row][column_2], region[row][column_1]
  end

  def swap_rows(column:, row_1:, row_2:)
    region[row_1][column], region[row_2][column] = region[row_2][column], region[row_1][column]
  end
end

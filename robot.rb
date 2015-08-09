require 'pry'
class Robot
  def initialize(grid)
    @x = nil
    @y = nil
    @dir = nil
    @grid = grid
  end

  def run_instruction(instruction)
    ins, args = instruction.split
    case ins
    when "PLACE"     
      args = args.split(',')
      x = args[0].to_i
      y = args[1].to_i
      dir = args[2]    
      place(x, y, dir)
    when "MOVE"
      move
    when "LEFT"
      left
    when "RIGHT"
      right
    when "REPORT"
      report
    end
  end
 
  def placed?
    @x && @y && @dir
  end

  def valid_direction?(dir)
    dir == "NORTH" || dir == "SOUTH" || dir == "EAST" || dir == "WEST"
  end
  
  def place(x, y, dir)
    if @grid.valid_location?(x,y) && valid_direction?(dir)
      @x = x
      @y = y
      @dir = dir
    end
  end

  def move
    return unless placed?
    case @dir
    when "NORTH"
      if @grid.valid_location?(@x, @y + 1)
        @y = @y + 1
      end
    when "EAST"
      if @grid.valid_location?(@x + 1 , @y)
        @x = @x + 1
      end
    when "SOUTH"
      if @grid.valid_location?(@x, @y - 1)  
        @y = @y - 1
      end
    when "WEST"
      if @grid.valid_location?(@x - 1, @y)
        @x = @x - 1
      end
    end
  end

  directions = ['NORTH', 'EAST', 'SOUTH', 'WEST']

  def right
    return unless placed?
    cur = directions.index(@dir)
    if cur + 1 > 3
      @dir = directions[0]
    else   
      @dir = directions[cur + 1] 
    end
  end

  def left
    return unless placed?
    directions = directions.reverse
    cur =  directions.index(@dir)
    if cur + 1 > 3
      @dir = directions[0]
    else
      @dir = directions[cur + 1]
    end  
  end

  def report
    return unless placed?   
    puts "#{@x},#{@y},#{@dir}"
  end
end

require './grid'
require './robot'

def parse_instructions
  grid = Grid.new(5,5)
  robot = Robot.new(grid)
  instructions = File.readlines('./instructions').map(&:strip).reject {|c| c == ""}
  instructions.each do |instruction|
    robot.run_instruction(instruction)
  end
end
parse_instructions

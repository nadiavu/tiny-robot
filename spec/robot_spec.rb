require 'spec_helper'

describe Robot do
  before :each do
    grid = Grid.new(5,5)
    @robot = Robot.new(grid)
  end

  it "should place robot within grid bounds" do
    @robot.place(1,1,"NORTH")
  end
  
  it "should move the robot within the grid bounds" do
    @robot.place(1,1,"NORTH")
    @robot.move
    out = capture_stdout { @robot.report }
    expect(out).to eq("1,2,NORTH\n")
  end

  it "should turn the robot to the left" do
    @robot.place(1,1,"NORTH")
    @robot.left
    out = capture_stdout { @robot.report }
    expect(out).to eq("1,1,WEST\n")
  end

  it "should turn the robot to the right" do
    @robot.place(1,1,"NORTH")
    @robot.right
    out = capture_stdout { @robot.report }
    expect(out).to eq("1,1,EAST\n")
  end
end


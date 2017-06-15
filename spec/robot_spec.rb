require "robot"
require "world"

describe Robot do
  it "ignores if its not in the world" do
    robot = Robot.new()
    expect(robot.report()).to eql(nil)
    expect(robot.move()).to eql(nil)
    expect(robot.left()).to eql(nil)
    expect(robot.right()).to eql(nil)
  end

  it "can report its status" do
    robot = Robot.new()
    World.new().place(robot, 1, 2, World::SOUTH)
    expect(robot.report()).to eql([1, 2, World::SOUTH])
  end

  it "can move" do
    robot = Robot.new()
    World.new().place(robot, 0, 0, World::NORTH)
    robot.move()
    expect(robot.report()).to eql([0, 1, World::NORTH])
  end

  it "can turn left" do
    robot = Robot.new()
    World.new().place(robot, 0, 0, World::NORTH)
    robot.left()
    expect(robot.report()).to eql([0, 0, World::WEST])
  end

  it "can turn right" do
    robot = Robot.new()
    World.new().place(robot, 0, 0, World::NORTH)
    robot.right()
    expect(robot.report()).to eql([0, 0, World::EAST])
  end

  it "can move multiple times" do
    robot = Robot.new()
    World.new().place(robot, 1, 2, World::EAST)
    robot.move()
    robot.move()
    robot.left()
    robot.move()
    expect(robot.report()).to eql([3, 3, World::NORTH])
  end

  it "cannot move off the table" do
    robot = Robot.new()
    World.new().place(robot, 4, 4, World::NORTH)
    robot.move()
    expect(robot.report()).to eql([4, 4, World::NORTH])
  end
end
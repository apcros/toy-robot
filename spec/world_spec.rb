require "world"

describe World do
  it "cannot place something off the table" do
    world = World.new()
    robot = Robot.new()

    expect(world.place(robot, 5, 5, 'NORTH')).to eql(nil)
    expect(world.report(robot)).to eql([ ])

    expect(world.place(robot, -1, -1, 'NORTH')).to eql(nil)
    expect(world.report(robot)).to eql([ ])
  end

  it "handles the unplaced robot" do
    world = World.new()
    robot = Robot.new()

    expect(world.left(robot)).to eql(nil)
    expect(world.right(robot)).to eql(nil)
    expect(world.move(robot)).to eql(nil)
    expect(world.report(robot)).to eql([ ])
  end

end

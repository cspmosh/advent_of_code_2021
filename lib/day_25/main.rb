require_relative 'sea_floor'

sea_floor = SeaFloor.new

File.foreach("data/day_25/sea_cucumbers.txt", chomp: true) do |cucumbers|
  sea_floor.add_cucumbers(cucumbers.split(""))
end

print "step: " + sea_floor.continuously_move_cucumbers.to_s

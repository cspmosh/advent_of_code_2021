require 'day_25/sea_floor'

describe SeaFloor do
  let(:sea_floor) { described_class.new }

  describe "#move_cucumbers" do
    context "when there is something to move" do
      it "moves the east-facing cucumbers to the right" do
        sea_floor.add_cucumbers("..>")
        sea_floor.add_cucumbers(">..")

        has_open_spaces = sea_floor.move_cucumbers

        expect(sea_floor.region[0].join).to eq(">..")
        expect(sea_floor.region[1].join).to eq(".>.")
        expect(has_open_spaces).to be true
      end

      it "moves the south-facing cucumbers down" do
        sea_floor.add_cucumbers("v..")
        sea_floor.add_cucumbers("..v")

        has_open_spaces = sea_floor.move_cucumbers

        expect(sea_floor.region[0].join).to eq("..v")
        expect(sea_floor.region[1].join).to eq("v..")
        expect(has_open_spaces).to be true
      end
    end

    context "when there are some blocking cucumbers" do
      context "when the cucumber is facing east" do
        it "prevents the blocked cucumber from moving to the right" do
          sea_floor.add_cucumbers(".>>")
          sea_floor.add_cucumbers(">..")

          has_open_spaces = sea_floor.move_cucumbers

          expect(sea_floor.region[0].join).to eq(">>.")
          expect(sea_floor.region[1].join).to eq(".>.")
          expect(has_open_spaces).to be true
        end
      end

      context "when the cucumber is facing south" do
        it "prevents the blocked cucumber from moving down" do
          sea_floor.add_cucumbers("v..")
          sea_floor.add_cucumbers("..>")

          has_open_spaces = sea_floor.move_cucumbers

          expect(sea_floor.region[0].join).to eq("v..")
          expect(sea_floor.region[1].join).to eq(">..")
          expect(has_open_spaces).to be true
        end
      end
    end

    context "when there is nothing to move" do
      it "returns false" do
        sea_floor.add_cucumbers(">>>")

        has_open_spaces = sea_floor.move_cucumbers

        expect(has_open_spaces).to be false
      end
    end
  end

  describe "#continuously_move_cucumbers" do
    it "returns the first step on which no cucumbers move" do
      sea_floor.add_cucumbers("v...>>.vv>")
      sea_floor.add_cucumbers(".vv>>.vv..")
      sea_floor.add_cucumbers(">>.>v>...v")
      sea_floor.add_cucumbers(">>v>>.>.v.")
      sea_floor.add_cucumbers("v>v.vv.v..")
      sea_floor.add_cucumbers(">.>>..v...")
      sea_floor.add_cucumbers(".vv..>.>v.")
      sea_floor.add_cucumbers("v.v..>>v.v")
      sea_floor.add_cucumbers("....v..v.>")

      steps = sea_floor.continuously_move_cucumbers

      expect(steps).to eq(58)
    end
  end
end

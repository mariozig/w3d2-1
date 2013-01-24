require './reversi'
require 'rspec'

include Reversi

# MZ: Would be cool to see doubles when you test more involved interactions with other classes
describe "Piece" do
  subject(:piece){ Piece.new(:teal) }

  it { should respond_to(:color) }

  it "should initialize with a color" do
    piece.color.should eq(:teal)
  end

  it "should flip its color" do
    piece.flip

    piece.color.should eq(:pink)
  end
end

describe "Board" do
  subject(:board){ Board.new }

  it {should respond_to(:rows)}

  it "should have 8 rows" do
    board.rows.count.should eq(8)
  end

  it "should have 8 columns per row" do
    board.rows[0].count.should eq(8)
  end

  it "should have 4 pieces in middle" do
    board.rows[3][3].color.should eq(:pink)
    board.rows[3][4].color.should eq(:teal)
    board.rows[4][3].color.should eq(:teal)
    board.rows[4][4].color.should eq(:pink)
  end

  describe '#place' do
    it "should be able to have new pieces placed on to it" do
      board.place(3, 5, :teal)
      board.rows[3][5].color.should eq(:teal)
    end
  end

  describe "#valid_move?" do
    it "should return true when placing a valid move" do
      board.valid_move?(2, 4, :teal).should be_true
    end

    it "should return false when placing piece on top of another piece" do
      board.valid_move?(3, 4, :teal).should be_false
    end

    it "should return false when placing piece w/out flipping other peices" do
      board.valid_move?(2, 2, :teal).should be_false
    end
  end

  describe "#find_opposing_neighbors" do
    it "should find coordinates of opposing neighbors" do
      board.find_opposing_neighbors(3, 5, :pink).should == [[3,4]]
    end
  end
end
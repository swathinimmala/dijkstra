require "spec_helper"
require_relative '../dijkstra'

describe "Dijkstra" do
	before(:all) do
    @matrix = [
				    [0, 7, 9, 0, 0, 14],
				    [7, 0, 10, 15, 0, 0],
				    [9, 10, 0, 11, 0, 2],
				    [0, 15, 11, 0, 6, 0],
				    [0, 0, 0, 6, 0, 9],
				    [14, 0, 2, 0, 9, 0]
				    ]
  end
   
  context "accepts matrix and source parameters" do
	  it "accepts (matrix, src ) as parameters" do
	    expect { Dijkstra.new(@matrix, 0 ) }.to_not raise_error
	  end
	  it "raises an error without parameters" do
	    expect { Dijkstra.new }.to raise_error(ArgumentError)
	  end
	  it "raises an error with one parameter" do
	    expect { Dijkstra.new(@matrix) }.to raise_error(ArgumentError)
	  end
	end

	context "calculate shortest path" do

		context "from source 1" do
			subject { Dijkstra.new(@matrix, 0) } # index of 1 is 0
			it "should give valid shortest paths" do
				expect(subject.dijkstra).to eq([0, 7, 9, 20, 20, 11])
			end
			it "should not give invalid shortest paths" do
				expect(subject.dijkstra).to_not eq([0,7,9,12]) 
		  end
		end

		context "from source 2" do
			subject { Dijkstra.new(@matrix, 1) } # index of 2 is 1
			it "should give valid shortest paths" do
				expect(subject.dijkstra).to eq([7,0,10,15,21,12])
			end
			it "should not give invalid shortest paths" do
				expect(subject.dijkstra).to_not eq([0,7,9,12]) 
		  end
		end

		it "should fail with invalid source" do
			dijkstra = Dijkstra.new(@matrix, 9)
			expect {dijkstra.dijkstra}.to raise_error
		end
	end
end
require 'rspec'
require 'tdd_projects'

=begin
clean and helpful cheatsheet to rspec that I found: https://devhints.io/rspec
=end

describe Array do
  describe "#my_uniq" do
    let(:not_uniq) { [1, 2, 1, 3, 3] }

    it "removes duplicates from an array" do
      expect(not_uniq.my_uniq).to eq([1, 2, 3])
    end

    it "returns the unique elements in the order in which they first appeared" do
      expect(not_uniq.my_uniq).not_to eq([1, 3, 2])
      expect(not_uniq.my_uniq).not_to eq([2, 1, 3])
      expect(not_uniq.my_uniq).not_to eq([2, 3, 1])
      expect(not_uniq.my_uniq).not_to eq([3, 1, 2])
      expect(not_uniq.my_uniq).not_to eq([3, 2, 1])
    end
  end

  describe "#two_sum" do
    let(:two_sum_arr) { [-1, 0, 2, -2, 1] }

    it "finds all pairs of positions where the elements at positions sum to zero" do
      expect(two_sum_arr.two_sum).to eq([[0, 4], [2, 3]])
    end

    it "should sort array of pairs dictionary-wise"
      expect(two_sum_arr.two_sum).not_to eq([[4, 0], [3, 2]])
    end
  end
end
# describe "my_one?" do
#     it "should accept an array and a block as args" do
#       expect { my_one?([5, 10, 7, 3]) { |n| n.even? } }.to_not raise_error
#     end

#     context "when exactly one element of the array results in true when passed into the block" do
#       it "should return true" do
#         expect(my_one?([5, 10, 7, 3]) { |n| n.even? } ).to eq(true)
#         expect(my_one?(["a", "b", "c", "x"]) { |char| char == "x" } ).to eq(true)
#       end
#     end

#     context "when there is not exactly one element that results in true when passed into the block" do
#       it "should return false" do
#         expect(my_one?([8, 10, 7, 3]) { |n| n.even? } ).to eq(false)
#         expect(my_one?(["a", "x", "c", "x"]) { |char| char == "x" } ).to eq(false)
#         expect(my_one?(["a", "b", "c", "d"]) { |char| char == "x" } ).to eq(false)
#       end
#     end

#     it "should not use the built-in Array#one?" do
#       array = [5, 10, 7, 3]
#       expect(array).to_not receive(:one?)
#       my_one?(array) { |n| n.even? }
#     end
#   end

def my_one?(arr, &prc)
    counter = 0
    arr.each do |el|
        counter += 1 if prc.call(el)
        return false if counter > 1
    end
    counter == 1 ? true : false
end
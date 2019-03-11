# describe "hash_select" do
#     it "should accept a hash and a block as args" do
#       expect { hash_select({"a"=>0, "b"=>1, "c"=> 2, "o"=>14}) { |k, v| "aeiou".include?(k) } }.to_not raise_error
#     end

#     it "should return a new hash containing only the key=>value pairs that resulted in true when passed into the block" do
#       expect(hash_select({"a"=>0, "b"=>1, "c"=> 2, "o"=>14}) { |k, v| "aeiou".include?(k) }).to eq({"a"=>0, "o"=>14})
#       expect(hash_select({"a"=>0, "b"=>1, "c"=> 2, "o"=>14}) { |k, v| v.even? }).to eq({"a"=>0, "c"=> 2, "o"=>14})
#     end

#     it "should not use the built-in Hash#select" do
#       hash = {"a"=>0, "b"=>1, "c"=> 2, "o"=>14}
#       expect(hash).to_not receive(:select)
#       hash_select(hash) { |k, v| "aeiou".include?(k) }
#     end
# end

def hash_select(hash, &prc)
    new_hash = Hash.new
    hash.each {|k, v| new_hash[k] = v if prc.call(k, v)}
    new_hash
end
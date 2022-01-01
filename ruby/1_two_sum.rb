# frozen_string_literal: true

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  hash = {}
  nums.each_with_index do |value, index|
    second_index = hash[target - value]
    return [index, second_index] if second_index

    hash.store(value, index)
  end
end

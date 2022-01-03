# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  arr = (nums1 + nums2).sort
  size = arr.size
  mid = len / 2

  return arr[mid] if size.odd?

  (arr[mid] + arr[mid - 1]) / 2.to_f
end

pp find_median_sorted_arrays([1, 2], [3, 4])

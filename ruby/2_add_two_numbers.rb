# frozen_string_literal: true

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  num = 0

  current1 = l1
  current2 = l2

  (0..nil).each do |i|
    num += (current1&.val || 0) * 10**i
    num += (current2&.val || 0) * 10**i
    current1 = current1&.next
    current2 = current2&.next
    break unless current1 || current2
  end
  num.to_s.split(//).reverse.map(&:to_i)
end

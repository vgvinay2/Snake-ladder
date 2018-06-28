#Given set of arrays items breakdown array items based on distribution value. distribution value is in
#terms of % and it should be 100%. Desired output will be an array of array elements with distributed 
#value.
# Example:
#  * elements = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], distribution-list = [20, 40, 20, 20]#[35,35,15,15]
#  * output = [[1, 2], [3, 4, 5, 6], [7, 8], [9, 10]]

# Implement the above game in ruby language
# Distribution is % value it should be an integer  (example: 20 in above example means 20%)
# Distribution list should be 100% (if (distribution-list > 100 < distribution-list) raise an error)
# Provide proper instructions to run the ruby file.
# Provide documentations for methods.
# Any constraints on the above programs can be documented as well.
# Test cases will be added advantages.
class BreakdownArray
def self.breakdown_array_items ele,list
    ele = ele.first
    p "first inpput for elements #{ele}"
    p "second input for distribution list #{list}"
    if list.inject(:+) == 100 && (list.inject([]){ |sum,v| sum << v%10 }.inject(:+) == 0)
      final = list.inject([]) do  |key,value| 
       index = (value/10) 
        key  <<  ele.shift(index)
        key 
      end  
     p "Break Down Array #{final}"
     final
   else
   	 p "Either sum of #{list} is not #{list.inject(:+)}% or it's elements are not multiple of 10"
   end 
 end
end
 elements = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], distribution_list = [30, 10, 20, 40]#[35,35,15,15]
 BreakdownArray.breakdown_array_items elements, distribution_list

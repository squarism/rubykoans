# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  
  # check for negative or zero sides
  [a, b, c].each do |arg|
    if arg < 1
      raise TriangleError, "Can't have a negative or zero side"
    end
  end
  
  # check for triangle sanity
  # any two sides must be greater than the remaining side
  hyp = [a,b,c].max
  array = [a,b,c]
  array.delete hyp
  if array.size > 1
    if (array[0] + array[1]) <= hyp
      raise TriangleError, "Failed triangle side length sanity check"
    end
  end
  
  if a == b && b == c
    :equilateral
  else
    if a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end

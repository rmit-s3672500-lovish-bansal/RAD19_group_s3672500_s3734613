require 'test_helper'

class CourseTest < ActiveSupport::TestCase
 def setup
    @Course = Course.new(name: "Example User", prerequisite: "Example course", Description: " Some Description")
  end

  test "should be valid" do
    assert @Course.valid?
  end
  
  test "name should be present" do
    @Course.name = "     "
    assert_not @Course.valid?
  end
  
  

end

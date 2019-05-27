require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  
  def setup
    @course = courses(:IOT)
    @location = @course.location.build(venue: "14.10.17")
  end
  
  # test "the truth" do
  #   assert true
  # end
end

module CoursesHelper
    def gravatar_for(course)
    gravatar_id = Digest::MD5::hexdigest(course.name)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: course.name, class: "gravatar")
  end
  
  def getCategory(catId)
    Category.find_by(id: catId)
  end

  def getLocation(locId)
    Location.find_by(id: locId)
  end

  def getCoordinator(coordId)
    Coordinator.find_by(id: coordId)
  end

end

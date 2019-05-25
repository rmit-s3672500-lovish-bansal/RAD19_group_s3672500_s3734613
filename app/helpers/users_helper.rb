module UsersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(users, size: 80)
    gravatar_id = Digest::MD5::hexdigest(users.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: users.name, class: "gravatar")
  end
end
module PostsHelper
  def limit_post_description(description)
    description[0..10] + "..."
  end
end

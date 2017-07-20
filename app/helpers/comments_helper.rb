module CommentsHelper
  def user(post)
    User.find(post.comments.last.user_id)
  end
end

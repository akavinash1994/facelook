module CommentsHelper
  def user(post)
    User.find_by(id: post.comments.last.user_id)
  end
end

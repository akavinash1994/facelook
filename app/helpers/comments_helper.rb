module CommentsHelper
  def user(post)
    User.find_by(id: post.comments.last.user_id)
  end

  def last_comment
    @post.comments.last.content
  end 
end

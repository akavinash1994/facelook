module LikesHelper
  def count(likeable_type ="", likeable_id = 0)
    Like.where(likeable_type: likeable_type, likeable_id: likeable_id).count
  end
end

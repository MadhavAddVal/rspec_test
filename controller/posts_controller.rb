class PostsController
  def initialize
    @posts = []
  end

  def index
    @posts
  end

  def show(id)
    @posts.find { |post| post[:id] == id }
  end

  def create(params)
    post = params.merge(id: @posts.size + 1)
    @posts << post
    post
  end

  def update(id, params)
    post = show(id)
    return nil unless post
    post.merge!(params)
  end

  def destroy(id)
    @posts.reject! { |post| post[:id] == id }
  end
end

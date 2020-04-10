class PostsController < ApplicationController
  def new
    @post = Post.new
    @post.photos.build
  end
end

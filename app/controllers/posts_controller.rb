class PostsController < ApplicationController

	before_action :find_post, only: [:show, :update, :edit, :destroy]

	def index
		
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new post_params

		if @post.save
			redirect_to @post, notice: "Hellzz yeah, Goranci!"
		else
			render 'new', notice: "Oh nouu! I was unable to save your post!"
		end
	end

	def show
	end

	def edit
	end

	def update
		if @post.update post_params
			redirect_to @post, notice: "Hazzaaaah! Your article is updated"
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :content, :slug)
	end

	def find_post
		@post = Post.friendly.find(params[:id])
	end
end

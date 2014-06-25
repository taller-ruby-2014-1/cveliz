class PostsController < ApplicationController
	def index
		@posts = Post.all
		@last = Post.last(5)
	end

	def new
		@post = Post.new
	end

	def create
		#render text: params[:post].inspect
		@post = Post.new(post_params)
		@last = Post.last(5)
		if @post.save
			redirect_to @post
		else 
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
		@last = Post.last(5)
	end

	def edit
		@post = Post.find(params[:id])
		@last = Post.last(5)
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :text))
			redirect_to @post
		else
			render 'edit'
		end
		@last = Post.last(5)
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
		
	end

	private
		def post_params
			params.require(:post).permit(:title, :text)
		end

	before_filter :authenticate_user!

end

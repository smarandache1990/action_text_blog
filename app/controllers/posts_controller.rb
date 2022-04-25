class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
        @posts = Post.all()
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
          flash[:success] = "Post successfully created"
          redirect_to @post
        else
          flash[:error] = "Something went wrong"
          render :new, status: :unprocessable_entity
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
          flash[:success] = "Post was successfully updated"
          redirect_to @post
        else
          flash[:error] = "Something went wrong"
          render :edit, status: :unprocessable_entity
        end
    end
    
    def destroy
        @post = Post.find(params[:id])

        if @post.destroy
            flash[:success] = 'Post was successfully deleted.'
            redirect_to posts_url, status: :see_other
        else
            flash[:error] = 'Something went wrong'
            redirect_to posts_url, status: :unprocessable_entity
        end
    end
    
    
    

    private

    def post_params
        params.require(:post).permit(:title, :body, :status)
    end
    
end

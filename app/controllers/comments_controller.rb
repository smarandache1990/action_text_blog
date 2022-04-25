class CommentsController < ApplicationController
    before_action :authenticate_user!, only: :create

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)

        if @comment.save
          flash[:success] = "Comment successfully created"
          redirect_to post_url(@post)
        else
          flash[:error] = "Something went wrong"
          render post_url
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])

        if @comment.destroy
            flash[:success] = 'Comment was successfully deleted.'
            redirect_to posts_url, status: :see_other
        else
            flash[:error] = 'Something went wrong'
            redirect_to posts_url
        end
    end
    
    

    private

    def comment_params
        params.require(:comment).permit(:commenter, :body, :status)
    end
end

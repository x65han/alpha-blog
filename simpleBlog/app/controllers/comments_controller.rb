class CommentsController < ApplicationController
    http_basic_authenticate_with name: "admin", password: "123", except: [:create]

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params);
        redirect_to post_path(@post)
    end

    private def comment_params
        params.require(:comment).permit(:username, :body)
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end
end

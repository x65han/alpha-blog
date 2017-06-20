class PostsController < ApplicationController
    http_basic_authenticate_with name: "admin", password: "123", except: [:index, :show]

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])

        if (@post.update(params_check))
            redirect_to @post
        else
            render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end
    def create
        @post = Post.new(params_check)

        if (@post.save)
            redirect_to @post
        else
            render 'new'
        end
    end

    private def params_check
        params.require(:post).permit(:title, :body)
    end
end

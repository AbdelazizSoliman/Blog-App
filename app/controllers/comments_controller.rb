class CommentsController < ApplicationController

    def new
        @comment = @post.comments.new
    end

    def create
        @comment = @post.comments.new(comment_params)
        @comment.author = @user # Assign the current user to the comment
        if @comment.save
            flash[:notice] = 'Comment created successfully.'
            redirect_to user_post_path(@user, @post)
        else
            render 'new'
        end
    end

    private 
end

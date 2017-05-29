class CommentsController < ApplicationController

before_action :find_article
before_action :find_comment, only: [:edit, :update, :destroy]

def create
	@comment = Comment.new(comment_params)
	@comment.article_id = params[:article_id]

	@comment.save

	 

	redirect_to article_path(@comment.article)
end


def edit
end

def update
	@comment.content = comment_params
	if @comment.update(comment_params)
		redirect_to article_path(@article)
	else
		render 'edit'
	end
end

def destroy
	@comment.destroy
	redirect_to article_path(@article)
end

private

def comment_params
	params.require(:comment).permit(:content, :author_name)
end

def find_article
	@article = Article.find(params[:article_id])
end

def find_comment
	@comment = @article.comments.find(params[:id])
end
end

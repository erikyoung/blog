class NotificationMailer < ApplicationMailer
	default from: 'youngerik26@gmail.com'

	def comment_added(my_comment)
		#@commment = comment.article
		@article_owner = @article.user
    mail(to: @article_owner.email,
         subject: "A comment has been added to #{@article.title}")
  end
end

# Ignore essa parte, vá até o CommentsController

class ApplicationController; end

class User
  attr_accessor :id, :username

  def initialize(id, username)
    @id       = id
    @username = username
  end
end

class Comment
  attr_accessor :id, :author, :content

  def initialize(id, author, content)
    @id = id
    @author = author
    @content = content
  end
end

class Post
  attr_accessor :id, :title, :content, :comments

  def initialize(id, title, content, comments)
    @id       = id
    @title    = title
    @content  = content
    @comments = comments
  end

  def self.all
    user = User.new(1, 'fernando')
    [
      new(1, 'Test 1', 'Test 1 Content', [
            Comment.new(1, user, 'Comment 1'),
            Comment.new(2, user, 'Comment 2'),
            Comment.new(3, user, 'Comment 3')
          ]),
      new(2, 'Test 2', 'Test 2 Content', [
            Comment.new(4, user, 'Comment 4'),
            Comment.new(5, user, 'Comment 5'),
            Comment.new(6, user, 'Comment 6')
          ]),
      new(3, 'Test 3', 'Test 3 Content', [
            Comment.new(7, user, 'Comment 7'),
            Comment.new(8, user, 'Comment 8'),
            Comment.new(9, user, 'Comment 9')
          ])
    ]
  end
end

# Que problemas você, enxerga no controller abaixo?
class CommentsController < ApplicationController
  def users_comments(params)
    posts ||= Post.all
    comments ||= posts.map(&:comments).flatten
    comments.select do |comment|
      comment.author.username == params[:username]
    end
  end
end

# Teste de uso
user_comments = CommentsController.new.users_comments(username: 'fernando')
user_comments.each { |user_comment| puts "###{user_comment.id} #{user_comment.author.username}: #{user_comment.content}" }

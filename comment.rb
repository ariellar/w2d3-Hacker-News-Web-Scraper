class Comment

  attr_accessor :text
  attr_reader :user

  def initialize(user, text)
    @user = user
    @text = text
  end
  
end


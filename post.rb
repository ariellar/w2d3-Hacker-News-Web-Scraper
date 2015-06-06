require 'nokogiri'
require 'pry'
require 'open-uri'


# doc = Nokogiri::HTML(File.open('post.html'))

class Post
  attr_reader :title, :url, :points, :item_id
  def initialize
    @title = doc.search('.title a').text
    @url = https://news.ycombinator.com/item?id=7663775
    @points = doc.search('.subtext > span:first-child').map { |span| span.inner_text}
    @item_id = doc.search('.subtext > a:nth-child(3)').map {|link| link['href'] }
    @comments_list = []

    url_object.search('.default').each do |raw_c|
      user = raw_c.search('.comhead a:first-child').inner_text
      text = raw_c.search('.comment > font:first-child').inner_text
      add_comment(user, text)
  end
# returns all the comments associated with a particular post
  def comments(doc)
    @comments_list = doc.search('.comment > font:first-child').map { |font| font.inner_text}
    p comments_list
  end
# takes a Comment object as its input and adds it to the comment list.
  def add_comment(user, text)
    @comments_list << Comment.new(user, text)
  end
end


# def extract_usernames(doc)
#   doc.search('.comhead > a:first-child').map do |element|
#     element.inner_text
#   end
# end
# p extract_usernames(doc)
# comments = doc.search('.comment > font:first-child').map { |font| font.inner_text}
# p comments
# ('.title a').text


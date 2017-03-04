class StaticPagesController < ApplicationController
  def index
    @latest_books = []
    Newest.first(3).each {|newest| @latest_books << newest.book}
    @bestsellers = [] 
    Bestseller.first(4).each {|best| @bestsellers << best.book}
    @active_book = @latest_books.first.id 
  end
end
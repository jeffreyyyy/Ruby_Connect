class QuestionsController < ApplicationController
  
  def index
    @title = "Home | Ruby.Connect"
    @questions = Question.all
  end
  
end
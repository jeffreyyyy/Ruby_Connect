class QuestionsController < ApplicationController
  
  def index
    @title = "Home | Ruby.Connect"
    @questions = Question.all
  end
  
  def new
    @title = "Post Question | Ruby.Connect"
    @question = Question.new
  end
  
  def show
    @title = "Ruby.Connect"
    @question = Question.find(params[:id])
  end
  
  def create
    @question = Question.new(params[:question])
    if @question.save
      redirect_to @question
    else
      @title = "Post Question | Ruby.Connect"
      render 'new'
    end
  end

end
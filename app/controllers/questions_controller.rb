class QuestionsController < ApplicationController
  
  def index
    @title = "Home | Ruby.Connect"
    @questions = Question.order(:title).page params[:page]
  end
  
  def new
    @title = "Post Question | Ruby.Connect"
    @question = Question.new
  end
  
  def show
    @question = Question.find(params[:id])
    @title = "#{@question.title} | Ruby.Connect"
    @answers = @question.answers
    @answer = Answer.new
    @answer[:question_id] = params[:id]
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
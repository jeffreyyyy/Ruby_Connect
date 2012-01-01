class AnswersController < ApplicationController
  
  def create
    @question = Question.find(params[:answer][:question_id])
    @answer = @question.answers.build(params[:answer])
    if @answer.save
      redirect_to question_path(@question)
    else
      @title = "asdf"
      redirect_to question_path(@question)
      flash[:notice] = "Please answer the question before submission!"
    end
  end
  
end
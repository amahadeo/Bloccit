class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    if @question.resolved
      @status = "Resolved!"
    else
      @status = "Still Unresolved :("
    end
  end

  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(params.require(:question).permit(:title, :body))
    if @question.save
      flash[:notice] = "Your question has been asked."
      redirect_to @question
    else
      flash[:error] = "Something's wrong with your question, try asking again."
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params.require(:question).permit(:title, :body, :resolved))
      flash[:notice] = "Your question has been saved."
      redirect_to @question
    else
      flash[:error] = "Your question was not successfully updated, please try again"
      render :edit
    end
  end
end
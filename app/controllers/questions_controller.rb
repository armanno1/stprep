class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update, :show, :destroy]
  attr_accessor :station_id

  def index
    @question = Question.all
  end

  def new
    @question = Question.new
  end

  def update
    if @question.update(question_params)
      flash[:success] = "Question updated."
      redirect_to station_path(@question.station)
    else
      render "edit"
    end
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "Question created!"
      redirect_to station_path(@question.station)
    else
      render 'new'
    end
  end

  def destroy
    if @question.destroy
      flash[:danger] = "Question deleted"
      redirect_to station_path(@question.station)
    else
      flash[:danger] = "Problem deleting Q"
      redirect_to station_path(@question.station)
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :answer, :station_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end

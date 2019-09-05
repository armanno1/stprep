class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update, :show, :destroy]
  attr_accessor :station_id

  def index
    @question = Question.all
  end

  def new
    @question = Question.new
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

  private
  def question_params
    params.require(:question).permit(:title, :answer, :station_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end

class QuestionsController < ApplicationController

  # GET /questions
  def index
    @most_active = Question.most_active
    @questions = Question.all
  end

  # GET /questions/1
  def show
    @question = Question.find(params[:id])
  end

  # GET /questions/new
  def new
    @question = Question.new
    @question.options.build
    @question.options.build
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render action: 'new'
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:question).permit(:description, options_attributes: [:id, :question_id, :content])
  end
end


class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      redirect_to @vote.option.question, notice: 'Vote was successfully created.'
    else
      render action: 'new'
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def vote_params
    params.permit(:option_id)
  end
end


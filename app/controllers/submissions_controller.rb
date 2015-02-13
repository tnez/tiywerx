class SubmissionsController < ApplicationController

  def index
    @assignment = Assignment.find(params[:assignment_id])
    @submissions = @assignment.submissions
  end

  def show
    @submission = Submission.find(params[:id])
  end
  
  def new
    @assignment = Assignment.find(params[:assignment_id])
    @submission = @assignment.submissions.new(user_id: current_user.id )
  end

  def create
    @assignment = Assignment.find(params[:assignment_id])
    @submission = @assignment.submissions.new(submission_params)
    @submission.user_id = current_user.id
    if @submission.save
      flash[:notice] = "Submission was created successfully."
      redirect_to assignment_path(@assignment)
    else
      flash[:alert] = "Submission could not be created."
      render :new
    end
  end

  def edit
    @submission = Submission.find(params[:id])
  end

  def update
    @submission = Submission.find(params[:id])
    if @submission.update(submission_params)
      flash[:notice] = 'Submission was successfully updated.'
      redirect_to submission_path(@submission)
    else
      flash[:alert] = 'Submission could not be updated.'
      render :edit
    end
  end

  private
  def submission_params
    params.require(:submission).permit(:content,
                                       :user_id)
  end
end

class AssignmentsController < ApplicationController

  def index
    @assignments = Assignment.all
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    if @assignment.save
      flash[:success] = 'Assignment was successfully created.'
      redirect_to assignments_path
    else
      flash[:danger] = 'There was a problem creating the Assignment.'
      render :new
    end
  end

  def edit
    @assignment = Assignment.find(params[:id])
  end

  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.update(assignment_params)
      flash[:success] = 'Assignment was successfully updated.'
      redirect_to assignment_path(@assignment)
    else
      flash[:danger] = 'There was a problem updating the Assignment.'
      render :edit
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    if @assignment.destroy
      flash[:success] = 'Assignment was successfully deleted.'
      redirect_to assignments_path
    else
      flash[:danger] = 'There was a problem deleting the Assignment'
      redirect_to assignments_path
    end
  end

  def assignment_params
    params.require(:assignment).permit(:title,
                                       :description,
                                       :content);
  end
end

class StudentsController < ApplicationController
  def new
    @dojos = Dojo.all
    @dojo = Dojo.find(params[:dojo_id])
  end

  def create
    @new_student = Student.new(student_params)
    if @new_student.save
      redirect_to '/dojos/#{@student.dojo_id}', notice: "You have successfully created a new student"
    else
      flash['errors'] = @new_student.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @dojo = Dojo.find(params[:id])
  end

  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
  end
end

class StudentsController < ApplicationController
  def new
    @dojos = Dojo.all
    @dojo = Dojo.find(params[:dojo_id])
  end

  def create
    @new_student = Student.new(student_params)
    if @new_student.save
      redirect_to '/dojos/#{@new_student.dojo_id}', notice: "You have successfully created a new student"
    else
      flash['errors'] = @new_student.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @student = Student.with_dojo(params[:id]) #created a custom class method in Student model to join the student and the dojo
    @cohort = Student.cohort(@student) #created a custom class method in Student model
    #REMEMBER FAT MODEL SKINNY CONTROLLER
  end

  def edit
    @dojos = Dojo.all
    @student = Student.find(params[:id])
  end

  def update
    @new_student = Student.find(params[:id])
    if @new_student.update(student_params)
      redirect_to '/dojos/#{@new_student.dojo_id}', notice: "You have successfully updated the student"
    else
      flash['errors'] = @new_student.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @student = Student.find(params[:id]).destroy
    redirect_to '/dojos/#{@dojo.id}'
  end

  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
  end
end

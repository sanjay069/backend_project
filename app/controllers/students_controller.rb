class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :update, :destroy]
  load_and_authorize_resource

  # GET /students
  def index
    render json: Student.all
  end

  # GET /students/:id
  def show
    render json: @student
  end

  # POST /students
  def create
    @student = Student.new(student_params)
    authorize! :create, @student
    if @student.save
      render json: @student, status: :created
    else
      render json: { errors: @student.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /students/:id
  def update
    authorize! :update, @student
    if @student.update(student_params)
      render json: @student
    else
      render json: { errors: @student.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /students/:id
  def destroy
    authorize! :destroy, @student
    @student.destroy
    head :no_content
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :age, :title, :status)
  end

end

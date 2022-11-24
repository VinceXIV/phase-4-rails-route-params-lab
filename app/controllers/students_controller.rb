class StudentsController < ApplicationController

  def index
    byebug
    if params["name"].nil?
      students = Student.all
      render json: students
    elsif params
      matched_students = Student.where(["first_name = ? or last_name = ?", params["name"], params["name"]])
      render json: matched_students
    end
  end

  def show
    render json: Student.find_by(id: params[:id])
  end

end

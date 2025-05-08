class ApplicationController < ActionController::API

  include CanCan::ControllerAdditions

  def current_student
    # debugger
    Student.find_by(id: request.headers['X-Student-ID'])
  end

  def current_ability
    # debugger
    @current_ability ||= Ability.new(current_student)
  end
end

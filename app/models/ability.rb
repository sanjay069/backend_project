class Ability
  include CanCan::Ability

  def initialize(student)
    if student.present?
      if student.status == "admin"
        can :manage, Student
      elsif student.status == "user"
        can :read, Student
      end
    end
  end
end

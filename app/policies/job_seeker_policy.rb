class JobSeekerPolicy < ApplicationPolicy
  def update?
    # account owner
    # job seeker's case manager
    user == record || user == record.case_manager
  end

  def edit?
    update?
  end

  def home?
    # account owner
    user == record
  end

  def index?
    # all agency people
    user.is_a?(AgencyPerson)
  end

  def show?
    # account's owner
    # all agency people
    user == record || user.is_a?(AgencyPerson)
  end

  def destroy?
    # account's owner
    # agency admin
    user == record || user.is_a?(AgencyPerson)
  end

  def create?
    # unlogged in user
    # agency person
    user.nil? || user.is_a?(AgencyPerson)
  end

  def new?
    create?
  end

  def permitted_attributes
    if user == record
      [ :first_name,
        :last_name, 
        :email, 
        :phone,
        :password,
        :password_confirmation,
        :year_of_birth,
        :resume,
        :consent,
        :job_seeker_status_id,
        address_attributes: [:id, :street, :city, :zipcode, :state]
      ]
    elsif user == record.case_manager
      [ :first_name,
        :last_name, 
        :email, 
        :phone,
        :resume,
        :consent,
        :job_seeker_status_id,
        address_attributes: [:id, :street, :city, :zipcode, :state]
      ]
    end
  end

end
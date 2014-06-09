class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      if resource.save
        @profile = Profile.new()
        @profile.user_id = resource.id
        @profile.save
      end
    end
  end

  def destroy
    super do |resource|
      if resource.destroy
        @profile = Profile.find_all_by_user_id(resource.id)
        @profile.each do |profile|
          profile.destroy
        end
      end
    end
  end

end

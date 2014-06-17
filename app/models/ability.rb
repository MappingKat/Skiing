class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role.to_s == 'admin'
      can :manage, :all
    elsif user.persisted?
      can :create, Comment
      can :inappropriate, Comment
      can :read, :all
      can :manage, User do |thing|
        thing.id == user.id
      end
      can :manage, Profile do |profile|
        profile.user_id == user.id
      end
      can :destroy, Comment, user_id: user.id
    else
      can :create, User
      can :read, :all
    end
  end
end

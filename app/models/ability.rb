class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new(role: 'user')

    can :read, Group do |group|
      user.group_memberships.where(group_id: group.id).exists?
    end

    can :manage, Group do |group|
      user.group_memberships.where(group_id: group.id, role: 'admin').exists?
    end
  end
end

class User < ActiveRecord::Base
  has_many :group_memberships
  has_many :groups, through: :group_memberships

  def join(group, role = 'user')
    group_memberships.create(group_id: group.id, role: role)
  end
end

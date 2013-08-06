class GroupsController < ApplicationController
  def index
    @groups = if can?(:manage, Group)
      Group.all
    else
      current_user.groups
    end
  end
end

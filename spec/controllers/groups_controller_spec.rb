require 'spec_helper'
require 'cancan/matchers'

describe GroupsController do
  describe 'GET index' do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      groups = FactoryGirl.create_list(:group, 3)
      groups.first(2) do |group|
        user.join(group)
      end
    end

    it 'is really werid' do
      controller.stub(:current_user).and_return(user)

      get :index
      expect(assigns(:groups)).to have(2).groups
    end

    it 'wtf?' do
      ability = Ability.new(nil)
      expect(ability).not_to be_able_to(:manage, Group) # this will fail.
    end
  end
end

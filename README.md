# Install
```sh
$ bundle install
```

# Run the tests
```sh
$ rspec
```

# In Short
```ruby
# ability.rb
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

# weirdo spec
it 'wtfs' do
  ability = Ability.new(nil)
  expect(ability).not_to be_able_to(:manage, Group) # this will fail
end
```

require 'rspec'
require_relative '../../controller/groups_controller'
require_relative '../../file/group'

RSpec.describe GroupsController do
  before(:each) do
    Group.instance_variable_set(:@groups, [])
  end

  let(:controller) { GroupsController.new }

  describe '#create' do
    it 'creates and returns a list of all groups' do
      controller.create(name: 'team 1', group_type: 'Public', description: 'This is the public group of team 1', size: 10)
      controller.create(name: 'team 2', group_type: 'Private', description: 'This is the private group of team 2', size: 20)
      controller.create(name: 'team 3', group_type: 'Public', description: 'This is the public group of team 3', size: 30)
      
      expect(controller.index.size).to eq(3)
    end
  end

  describe '#update' do
    let!(:group) { controller.create(name: 'team 1', group_type: 'Public', description: 'This is the public group of team 1', size: 10).first }

    it 'updates the group with the given id' do
      controller.update(group.id, name: 'team 1 updated')
      updated_group = controller.index.find { |g| g.id == group.id }
      expect(updated_group.name).to eq('team 1 updated')
    end

    it 'returns nil if the group does not exist' do
      expect(controller.update(999, name: 'team 1 updated')).to be_nil
    end
  end

  describe '#destroy' do
    let!(:group) { controller.create(name: 'team 1', group_type: 'Public', description: 'This is the public group of team 1', size: 10).first }

    it 'removes the group with the given id' do
      controller.destroy(group.id)
      expect(controller.index).to eq([])
    end
  end
end

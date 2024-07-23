class GroupsController
  def initialize
    @groups = Group.all
  end

  def index
    @groups
  end

  def new
    Group.new
  end

  def create(params)
    group = Group.new(params)
    if group.save
      puts 'Group has been created successfully'
      index
    else
      puts 'Failed to create group'
      nil
    end
  end

  def edit(id)
    Group.find(id) || 'Group not found'
  end

  def update(id, params)
    group = Group.find(id)
    if group && group.update(params)
      puts 'Group has been updated successfully'
      index
    else
      puts 'Failed to update group'
      nil
    end
  end

  def destroy(id)
    if Group.find(id)
      Group.destroy(id)
      puts 'Group has been deleted successfully'
      index
    else
      puts 'Group not found'
      nil
    end
  end
end

class Group
  attr_accessor :id, :name, :group_type, :description, :size

  @@next_id = 1
  @@groups = []

  def initialize(params = {})
    @id = @@next_id
    @@next_id += 1
    @name = params[:name]
    @group_type = params[:group_type]
    @description = params[:description]
    @size = params[:size]
  end

  def save
    @@groups << self
    true
  end

  def update(params)
    @name = params[:name] if params[:name]
    @group_type = params[:group_type] if params[:group_type]
    @description = params[:description] if params[:description]
    @size = params[:size] if params[:size]
    true
  end

  def self.find(id)
    @@groups.find { |group| group.id == id }
  end

  def self.all
    @@groups
  end

  def self.destroy(id)
    @@groups.reject! { |group| group.id == id }
  end
end

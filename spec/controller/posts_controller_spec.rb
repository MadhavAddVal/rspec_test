require 'rspec'
require_relative '../../controller/posts_controller'

RSpec.describe PostsController do
  let(:controller) { PostsController.new }
  describe '#index' do
    it 'returns the empty list of posts' do
      expect(controller.index).to eq([])
    end
    it 'returns the list of all posts' do
      controller.create(title: 'Post 1', body: "This is the body of post 1")
      controller.create(title: 'Post 2', body: "This is the body of post 2")
      controller.create(title: 'Post 3', body: "This is the body of post 3")
      expect(controller.index.size).to eq(3)
    end
  end
  describe '#show' do
    let!(:post) { controller.create(title: 'Post 1', body: "This is the body of post 1") }
    it 'returns the post with the given id' do
      expect(controller.show(post[:id])).to eq(post)
    end
    it 'returns nil if the post does not exist' do
      expect(controller.show(12)).to be_nil
    end
  end
  describe '#create' do
    it 'creates a new post' do
      post = controller.create(title: 'Post 1', body: "This is the body of post 1")
      expect(post[:title]).to eq('Post 1')
      expect(post[:body]).to eq('This is the body of post 1')
      expect(controller.index).to eq([post])
    end
  end
  describe '#update' do
    let!(:post) { controller.create(title: 'Post 1', body: "This is the body of post 1") }
    it 'updates the post with the given id' do
      controller.update(post[:id], title: 'post 1 updated')
      expect(controller.show(post[:id])[:title]).to eq('post 1 updated')
    end
    it 'retrun the nil if the post does bot exists' do
      expect(controller.update(12, title: 'post 1 updated')).to be_nil
    end
  end
  describe '#destroy' do
    let!(:post) { controller.create(title: 'Post 1', body: "This is the body of post 1") }
    it 'removes the post with the given id' do
      controller.destroy(post[:id])
      expect(controller.index).to eq([])
    end
  end
end
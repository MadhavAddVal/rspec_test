require 'rspec'
require_relative '../../controller/articles_controller'

RSpec.describe ArticlesController do 
    let(:article_repository) { double('ArticleRepository') }
    let(:article) { double('Article') }
    let(:params) { { title: 'New Article', content: 'This is the new article' } }

    before(:each) do
        @controller = ArticlesController.new(article_repository)
    end
    describe '#index' do
      it 'returns the all articles' do
        expect(article_repository).to receive(:all)
        @controller.index
      end
    end
    describe '#show' do
      it 'returns the article for a given ID' do
        expect(article_repository).to receive(:find).with(1)
        @controller.show(1)
      end
    end
    describe '#create' do
        context 'when save is successful' do
            it 'creates a new article' do
                allow(article_repository).to receive(:new).with(params).and_return(article)
                allow(article).to receive(:save).and_return(true)
                expect(@controller.create(params)).to eq(article)
            end
        end
        context 'when save is unsuccessful' do
          it 'returns the errors' do
            allow(article_repository).to receive(:new).with(params).and_return(article)
            allow(article).to receive(:save).and_return(false)
            allow(article).to receive(:errors).and_return('Title cannot be blank')
            expect(@controller.create(params)).to eq('Title cannot be blank')
          end
        end
    end
    describe '#update' do
        context 'when update is successful' do
            it 'updates the article' do
                allow(article_repository).to receive(:find).with(1).and_return(article)
                allow(article).to receive(:update).with(params).and_return(true)
                expect(@controller.update(1, params)).to eq(article)
            end
        end
        context 'when update is unsuccessful' do
          it 'returns the errors' do
            allow(article_repository).to receive(:find).with(1).and_return(article)
            allow(article).to receive(:update).with(params).and_return(false)
            allow(article).to receive(:errors).and_return('Title cannot be blank')
            expect(@controller.update(1, params)).to eq('Title cannot be blank')
          end
        end
    end
    describe '#destroy' do
        it 'destroys the article for a given ID' do
            expect(article_repository).to receive(:find).with(1).and_return(article)
            expect(article).to receive(:destroy)
            @controller.destroy(1)
        end
    end
end
describe CreateTagService do
  let(:poem) { FactoryGirl.create(:publication, :poem) }

  describe '#call' do
    context 'for new tag' do
      it 'creates tag for given model instance' do
        expect do
          CreateTagService.new(poem, 'tag_name').()
        end.to change { Tag.count }.by(1)
           .and change { Tagging.count }.by(1)
      end
    end

    context 'for existing tag' do
      before do
        CreateTagService.new(poem, 'tag_name').()
      end

      it 'associates tag with given model instance' do
        expect do
          CreateTagService.new(poem, 'tag_name').()
        end.to_not change { Tag.count }
      end
    end
  end
end

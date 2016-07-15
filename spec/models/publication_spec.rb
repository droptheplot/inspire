describe Publication, type: :model do
  describe '#tags' do
    let(:poem) { FactoryGirl.create(:publication, :poem) }

    before do
      CreateTagService.new(poem, 'first_tag').()
      CreateTagService.new(poem, 'second_tag').()
    end

    it 'returns tags' do
      expect(poem.tags.pluck(:name)).to eq(%w(first_tag second_tag))
    end
  end

  describe '#type=' do
    let(:poem) { FactoryGirl.build(:publication) }

    context 'with class' do
      it 'writes type attribute' do
        poem.type = 'Publication::Poem'
        expect(poem.type).to eq('Publication::Poem')
      end
    end

    context 'with string' do
      it 'writes type attribute' do
        poem.type = 'poem'
        expect(poem.type).to eq('Publication::Poem')
      end
    end
  end
end

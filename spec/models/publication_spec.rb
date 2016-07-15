describe Publication, type: :model do
  let(:poem) { FactoryGirl.create(:publication_poem) }

  describe '#tags' do
    before do
      CreateTagService.new(poem, 'first_tag').()
      CreateTagService.new(poem, 'second_tag').()
    end

    it 'returns tags' do
      expect(poem.tags.pluck(:name)).to eq(%w(first_tag second_tag))
    end
  end
end

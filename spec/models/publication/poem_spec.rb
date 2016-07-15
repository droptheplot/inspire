describe Publication::Poem, type: :model do
  describe '#metaphor' do
    let(:poem) { FactoryGirl.create(:publication_poem) }

    it 'returns poem description' do
      expect(poem.metaphor).to eq(poem.description)
    end
  end
end

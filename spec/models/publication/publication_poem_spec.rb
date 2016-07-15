describe Publication::Poem, type: :model do
  describe '#metaphor' do
    let(:poem) do
      Publication::Poem.create(
        FactoryGirl.attributes_for(:publication, :poem)
      )
    end

    it 'returns poem description' do
      expect(poem.metaphor).to eq(poem.description)
    end
  end
end

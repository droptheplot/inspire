describe PublicationDecorator do
  let(:author) { FactoryGirl.create(:author) }
  let(:poem_attributes) { FactoryGirl.attributes_for(:publication, :poem) }

  before do
    @poem = Publication::Poem.new(poem_attributes)
    @poem.author = author
    @poem.save

    @decorated_poem = PublicationDecorator.new(@poem)
  end

  describe '#signature' do
    it 'returns type and author name' do
      expect(@decorated_poem.signature).to eq(
        "Poem published by #{@poem.author.name}, less than a minute ago."
      )
    end
  end
end

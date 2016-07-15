describe ApplyRulesJob, type: :job do
  describe '#perform' do
    before do
      tag = FactoryGirl.create(:tag, name: 'tag_for_keyword')
      FactoryGirl.create(:rule, tag: tag, keyword: 'keyword')
    end

    context 'with keyword' do
      let(:poem) do
        FactoryGirl.create(:publication_poem, :with_keyword)
      end

      it 'creates tag for publication' do
        expect do
          ApplyRulesJob.perform_now(poem.id)
        end.to change { Tagging.count }.by(1)
      end
    end

    context 'without keyword' do
      let(:poem) do
        FactoryGirl.create(:publication_poem, :without_keyword)
      end

      it 'creates tag for publication' do
        expect do
          ApplyRulesJob.perform_now(poem.id)
        end.not_to change { Tagging.count }
      end
    end
  end
end

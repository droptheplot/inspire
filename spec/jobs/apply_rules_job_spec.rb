describe ApplyRulesJob, type: :job do
  describe '#perform' do
    before(:each) do
      tag = FactoryGirl.create(:tag, name: 'tag_for_keyword')
      FactoryGirl.create(:rule, tag: tag, keyword: 'keyword')
    end

    context 'with keyword' do
      let(:poem) do
        FactoryGirl.build(:publication, :poem, :with_keyword)
      end

      it 'creates tag for publication' do
        expect { poem.save }.to change { Tagging.count }.by(1)
      end
    end

    context 'without keyword' do
      let(:poem) do
        FactoryGirl.build(:publication, :poem, :without_keyword)
      end

      it 'do nothing' do
        expect { poem.save }.not_to change { Tagging.count }
      end
    end
  end
end

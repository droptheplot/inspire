describe Rule, type: :model do
  describe 'validations' do
    describe 'validate_count' do
      context 'if there are more rules than allowed' do
        before do
          FactoryGirl.create_list(:rule, Rule::MAX_COUNT)
        end

        let(:another_rule) { FactoryGirl.build(:rule) }

        it 'should have an error' do
          expect(another_rule).to be_invalid
        end
      end
    end
  end
end

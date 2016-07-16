feature 'Create publication' do
  before do
    @author = FactoryGirl.create(:author)
    @rule = FactoryGirl.create(:rule)

    visit(root_path)
  end

  before(:each) do
    click_link('New Poem')
  end

  context 'with required fields' do
    context 'with keyword' do
      it 'creates poem with tag' do
        fill_in(:publication_title, with: 'Poem title')
        fill_in(:publication_content, with: "Poem content with #{@rule.keyword}")
        fill_in(:publication_metaphor, with: 'Poem metaphor')

        click_button('Submit')

        expect(page.current_path).to eq(root_path)
        expect(page.status_code).to eq(200)
        expect(page).to have_content('Poem title')

        expect(page).to have_content(@rule.keyword)
        expect(page).to have_content(@rule.tag.name)
      end
    end

    context 'without keyword' do
      it 'creates poem without tag' do
        fill_in(:publication_title, with: 'Poem title')
        fill_in(:publication_content, with: 'Poem content')
        fill_in(:publication_metaphor, with: 'Poem metaphor')

        click_button('Submit')

        expect(page.current_path).to eq(root_path)
        expect(page.status_code).to eq(200)
        expect(page).to have_content('Poem title')

        expect(page).not_to have_content(@rule.keyword)
        expect(page).not_to have_content(@rule.tag.name)
      end
    end
  end

  context 'with missing required fields' do
    it 'shows errors' do
      fill_in(:publication_content, with: 'Poem content')

      click_button('Submit')

      expect(page).to have_content("Title can't be blank")
    end
  end
end

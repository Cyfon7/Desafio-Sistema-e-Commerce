require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'must not have two parents' do
    it 'creates the same category' do
      expect{ Category.create!([{name: "CategoryTest", category_id: 1}, {name: "CategoryTest", category_id: 2}])}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end

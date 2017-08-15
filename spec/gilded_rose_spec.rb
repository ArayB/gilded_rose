require 'rspec'
require_relative '../gilded_rose'

RSpec.describe GildedRose do
  describe '#tick' do
    let(:item) { GildedRose.new(name, initial_quality, initial_days_remaining) }
    let(:initial_quality) { 10 }
    let(:initial_days_remaining) { 5 }

    subject { item.tick }

    context 'with normal item' do
      let(:name) { 'NORMAL ITEM'}

      context 'before sell by date' do
        it 'updates quality correctly' do
          subject
          expect(item.quality).to eq(initial_quality - 1)
        end
      end
    end
  end
end

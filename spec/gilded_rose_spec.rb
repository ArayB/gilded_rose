require 'rspec'
require_relative '../gilded_rose'

RSpec.describe GildedRose do
  describe '#tick' do
    let(:item) { GildedRose.new(name, initial_quality, initial_days_remaining) }
    let(:initial_quality) { 10 }
    let(:initial_days_remaining) { 5 }

    before do
      item.tick
    end

    context 'with normal item' do
      let(:name) { 'NORMAL ITEM' }

      it 'updates days_remaining correctly' do
        expect(item.days_remaining).to eq(initial_days_remaining - 1)
      end

      context 'before sell by date' do
        it 'updates quality correctly' do
          expect(item.quality).to eq(initial_quality - 1)
        end
      end

      context 'on sell by date' do
        let(:initial_days_remaining) { 0 }

        it 'updates quality correctly' do
          expect(item.quality).to eq(initial_quality - 2)
        end
      end

      context 'after sell by date' do
        let(:initial_days_remaining) { -10 }

        it 'updates quality correctly' do
          expect(item.quality).to eq(initial_quality - 2)
        end
      end

      context 'of zero quality' do
        let(:initial_quality) { 0 }

        it 'updates quality correctly' do
          expect(item.quality).to eq(0)
        end
      end
    end

    context 'aged brie' do
      let(:name) { 'Aged Brie' }

      it 'updates days_remaining correctly' do
        expect(item.days_remaining).to eq(initial_days_remaining - 1)
      end

      context 'before sell by date' do
        it 'updates quality correctly' do
          expect(item.quality).to eq(initial_quality + 1)
        end

        context 'with max quality' do
          let(:initial_quality) { 50 }

          it 'updates quality correctly' do
            expect(item.quality).to eq(initial_quality)
          end
        end
      end

      context 'before on sell by date' do
        let(:initial_days_remaining) { 0 }

        it 'updates quality correctly' do
          expect(item.quality).to eq(initial_quality + 2)
        end

        context 'near max quality' do
          let(:initial_quality) { 49 }

          it 'updates quality correctly' do
            expect(item.quality).to eq(50)
          end
        end

        context 'with max quality' do
          let(:initial_quality) { 50 }

          it 'updates quality correctly' do
            expect(item.quality).to eq(initial_quality)
          end
        end
      end

      context 'after sell by date' do
        let(:initial_days_remaining) { -10 }

        it 'updates quality correctly' do
          expect(item.quality).to eq(initial_quality + 2)
        end

        context 'with max quality' do
          let(:initial_quality) { 50 }

          it 'updates quality correctly' do
            expect(item.quality).to eq(initial_quality)
          end
        end
      end
    end


    context 'Sulfuras' do
      let(:name) { 'Sulfuras, Hand of Ragnaros' }
      let(:initial_quality) { 80 }

      it 'updates days_remaining correctly' do
        expect(item.days_remaining).to eq(initial_days_remaining)
      end

      context 'before sell by date' do
        it 'updates quality correctly' do
          expect(item.quality).to eq(initial_quality)
        end
      end

      context 'on sell by date' do
        let(:initial_days_remaining) { 0 }

        it 'updates quality correctly' do
          expect(item.quality).to eq(initial_quality)
        end
      end

      context 'after sell by date' do
        let(:initial_days_remaining) { -10 }

        it 'updates quality correctly' do
          expect(item.quality).to eq(initial_quality)
        end
      end
    end

    context 'Backstage pass' do
      let(:name) { 'Backstage passes to a TAFKAL80ETC concert' }

      it 'updates days_remaining correctly' do
        expect(item.days_remaining).to eq(initial_days_remaining - 1)
      end

      context 'long before sell by date' do
        let(:initial_days_remaining) { 11 }

        it 'updates quality correctly' do
          expect(item.quality).to eq(initial_quality + 1)
        end
      end

      context 'medium close to  sell by date (upper bound)' do
        let(:initial_days_remaining) { 10 }

        it 'updates quality correctly' do
          expect(item.quality).to eq(initial_quality + 2)
        end

        context 'at max quality' do
          let(:initial_quality) { 50 }

          it 'updates quality correctly' do
            expect(item.quality).to eq(initial_quality)
          end
        end
      end

      context 'very close to  sell by date (upper bound)' do
        let(:initial_days_remaining) { 5 }

        it 'updates quality correctly' do
          expect(item.quality).to eq(initial_quality + 3)
        end

        context 'at max quality' do
          let(:initial_quality) { 50 }

          it 'updates quality correctly' do
            expect(item.quality).to eq(initial_quality)
          end
        end
      end

      context 'very close to  sell by date (lower bound)' do
        let(:initial_days_remaining) { 1 }

        it 'updates quality correctly' do
          expect(item.quality).to eq(initial_quality + 3)
        end

        context 'at max quality' do
          let(:initial_quality) { 50 }

          it 'updates quality correctly' do
            expect(item.quality).to eq(initial_quality)
          end
        end
      end

      context 'after sell by date' do
        let(:initial_days_remaining) { 0 }

        it 'updates quality correctly' do
          expect(item.quality).to eq(0)
        end
      end

      context 'after sell by date' do
        let(:initial_days_remaining) { -10 }

        it 'updates quality correctly' do
          expect(item.quality).to eq(0)
        end
      end
    end

    context 'Conjured item' do
      let(:name) { 'Conjured Mana Cake' }

      it 'updates days_remaining correctly' do
        skip
        expect(item.days_remaining).to eq(initial_days_remaining - 1)
      end

      context 'before sell by date' do
        it 'updates quality correctly' do
          skip
          expect(item.quality).to eq(initial_quality - 2)
        end

        context 'at zero quality' do
          let(:initial_quality) { 0 }

          it 'updates quality correctly' do
            skip
            expect(item.quality).to eq(initial_quality)
          end
        end
      end

      context 'on sell by date' do
        let(:initial_days_remaining) { 0 }

        it 'updates quality correctly' do
          skip
          expect(item.quality).to eq(initial_quality - 4)
        end

        context 'at zero quality' do
          let(:initial_quality) { 0 }

          it 'updates quality correctly' do
            skip
            expect(item.quality).to eq(initial_quality)
          end
        end
      end

      context 'after sell by date' do
        let(:initial_days_remaining) { -10 }

        it 'updates quality correctly' do
          skip
          expect(item.quality).to eq(initial_quality - 4)
        end

        context 'at zero quality' do
          let(:initial_quality) { 0 }

          it 'updates quality correctly' do
            skip
            expect(item.quality).to eq(initial_quality)
          end
        end
      end
    end
  end
end

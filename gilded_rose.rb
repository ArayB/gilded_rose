class InventoryItem
  attr_reader :name, :quality, :days_remaining
  def initialize(name, quality, days_remaining)
    @name = name
    @quality = quality
    @days_remaining = days_remaining
  end

  def tick
    amend_quality
    bump_days
  end

  def amend_quality
    if @quality > 0
      @quality -= 1
      @quality -= 1 if @days_remaining <= 0
    end
  end

  def bump_days
    @days_remaining -= 1
  end
end

class AgeingItem < InventoryItem
  def amend_quality
    if @quality > 0
      @quality += 1
      @quality += 1 if @days_remaining <= 0
    end
    @quality = 50 if @quality > 50
  end
end

class LegendaryItem < InventoryItem
  def amend_quality; end;
  def bump_days; end
end

class DatedItem < InventoryItem
  def amend_quality
    @quality = 0 if @days_remaining <= 0

    if @quality > 0
      @quality += 1
      @quality += 1 if @days_remaining <= 10
      @quality += 1 if @days_remaining <= 5
    end
    @quality = 50 if @quality > 50
  end
end

class ConjuredItem < InventoryItem
  def amend_quality
    if @quality > 0
      @quality -= 2
      @quality -= 2 if @days_remaining <= 0
    end
  end
end

class GildedRose
  ITEM_CLASS_MAP = {
    'Aged Brie' => AgeingItem,
    'Sulfuras, Hand of Ragnaros' => LegendaryItem,
    'Backstage passes to a TAFKAL80ETC concert' => DatedItem,
    'Conjured Mana Cake' => ConjuredItem
  }.freeze

  def initialize(name, quality, days_remaining)
    @name = name
    @quality = quality
    @days_remaining = days_remaining
    item_class = ITEM_CLASS_MAP.fetch(name) do
      InventoryItem
    end
    @item = item_class.new(name, quality, days_remaining)
  end

  def days_remaining
    @item.days_remaining
  end

  def name
    @item.name
  end

  def quality
    @item.quality
  end

  def tick
    @item.tick
  end
end

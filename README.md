# The Gilded Rose Kata

Another Ruby version of the Gilded Rose Kata.
The original can be found [here](http://iamnotmyself.com/2011/02/13/refactor-this-the-gilded-rose-kata/).

I used [Jim Weirich's version](https://github.com/jimweirich/gilded_rose_kata) to 
create the version that Sandi Metz talks about in her 
[All the little things](https://www.youtube.com/watch?v=8bZh5LMaSmE&t=227s&list=PLlbR-exSPwQYv9fpUSq3iuM10e2mLTKfY&index=4) talk.

The aim of the Kata is to refactor the GildedRose class into something a bit less... 
conditional?

## Installation

Clone the repo and run `bundle`. If you don't have the bundler gem installed you will need to run `gem install bundler`.

## Tests

I've used RSpec for the tests. Run them with `rspec` or `bundle exec rspec` from the project root.

## Original Kata Text

Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city ran by a 
friendly innkeeper named Allison. We also buy and sell only the finest goods. 
Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. 
We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, 
who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin 
selling a new category of items. First an introduction to our system:

    All items have a SellIn value which denotes the number of days we have to sell the item
    All items have a Quality value which denotes how valuable the item is
    At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

    Once the sell by date has passed, Quality degrades twice as fast
    The Quality of an item is never negative
    “Aged Brie” actually increases in Quality the older it gets
    The Quality of an item is never more than 50
    “Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
    “Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

    “Conjured” items degrade in Quality twice as fast as normal items
    

## Notes

I've changed `SellIn` to `days_remaining` to match Sandi's talk.

From Jim's version:

     Just for clarification, an item can never have its Quality increase above 50, 
     however "Sulfuras" is a legendary item and as such its Quality is 80 and it never alters.

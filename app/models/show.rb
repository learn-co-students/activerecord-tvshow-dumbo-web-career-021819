require 'pry'
class Show < ActiveRecord::Base
  def self.highest_rating
    self.all.maximum(:rating)
  end

  def self.most_popular_show
    self.all.find do |show|
      show.rating == highest_rating
    end
  end

  def self.lowest_rating
    self.all.minimum(:rating)
  end

  def self.least_popular_show
    self.all.find do |show|
      show.rating == lowest_rating
    end
  end

  def self.ratings_sum
    self.all.sum(:rating)
  end

  def self.popular_shows
      Show.where("rating > 5")
  end

  def self.shows_by_alphabetical_order
    Show.order(:name)
  end
end

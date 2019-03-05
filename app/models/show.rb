class Show < ActiveRecord::Base

	def self.highest_rating
		#should return the highest value in the ratings column. 
		Show.maximum(:rating)
	end

	def self.most_popular_show
		most_pop = nil
		self.all.each do |s|
			if Show.highest_rating == s.rating
				most_pop = s
			end
		end
		most_pop
	end


	def self.lowest_rating
		Show.minimum(:rating)
	end

	def self.least_popular_show
		least_pop = nil
		self.all.each do |s|
			if Show.lowest_rating == s.rating
				least_pop = s
			end
		end
		least_pop
	end


	def self.ratings_sum
		Show.sum(:rating)
	end

	def self.popular_shows
		Show.where("rating >5")
	end

	def self.shows_by_alphabetical_order
		Show.order(:name)
	end


end
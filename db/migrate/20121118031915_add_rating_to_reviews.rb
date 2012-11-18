class AddRatingToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :rating, :decimal

  end
end

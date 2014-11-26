class AddJudgedToPrediction < ActiveRecord::Migration
  def change
    add_column(:predictions, :judged, :boolean)
  end
end

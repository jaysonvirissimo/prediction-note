class ChangePredictionDefault < ActiveRecord::Migration
  def change
    change_column_default(:predictions, :judged, false)
  end
end

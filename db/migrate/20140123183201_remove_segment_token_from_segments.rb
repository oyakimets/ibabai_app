class RemoveSegmentTokenFromSegments < ActiveRecord::Migration
  def change
    remove_column :segments, :segment_token, :string
  end
end

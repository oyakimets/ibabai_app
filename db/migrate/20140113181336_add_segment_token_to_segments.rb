class AddSegmentTokenToSegments < ActiveRecord::Migration
  def change
    add_column :segments, :segment_token, :string
  end
end

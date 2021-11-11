class Bookmark < ApplicationRecord
    belongs_to :category
    belongs_to :type

    accepts_nested_attributes_for :category, :type, reject_if: :all_blank

end

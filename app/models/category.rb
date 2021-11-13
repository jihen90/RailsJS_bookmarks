class Category < ApplicationRecord
    belongs_to :category, optional: true
    has_many :bookmarks
    enum visibility: [ :statePublic, :statePrivate ]
end

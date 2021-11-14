class Category < ApplicationRecord
    belongs_to :category, optional: true
    has_many :bookmarks
    enum visibility: [ :statePublic, :statePrivate ]

    #Method to find subcategories from a category
    def subcategories(object)
        @subcategories = []
        object.each do |c| 
            if c.category_id == self.id
            @subcategories << c.name
            end
        end
        return @subcategories
    end

    #Method to find related categories and find their subcategories
    def findrelative(subCat)
        if self.category_id != nil
            self.subcategories(subCat)
        else
            self.subcategories(subCat)
        end
    end


end

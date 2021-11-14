class Category < ApplicationRecord
    belongs_to :category, optional: true
    has_many :bookmarks, dependent: :destroy
    
    enum visibility: [ :statePublic, :statePrivate ]
    validates :visibility, presence: true

    #Method to find subcategories to JSON
    def subcategories(object)
        @subcategories = []
        object.each do |c| 
            if c.category_id == self.id
            @subcategories << c.name
            end
        end
        return @subcategories unless @subcategories == []
    end

    #Method to find subcategories to HTML
    def findrelative(subcat)
        self.subcategories(subcat)
    end

end

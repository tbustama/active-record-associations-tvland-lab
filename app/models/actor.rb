class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters
    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def list_roles
        names = self.characters.map{|character| character.name}
        show_names = self.characters.map{|character| character.show.name}
        map = names.zip(show_names).map{|arr| "#{arr[0]} - #{arr[1]}"} 
    end
end
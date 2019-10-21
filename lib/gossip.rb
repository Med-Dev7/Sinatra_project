# require 'pry'
# require 'csv'
class Gossip
    attr_accessor :author, :content
    def initialize(author, content)
        @author = author
        @content = content
    end

    def save
        CSV.open("./db/gossip.csv", 'ab') do |ligne|
            ligne << [@author, @content]  
        end
    end

    def self.all
        all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_ligne|
            
            all_gossips << Gossip.new(csv_ligne[0], csv_ligne[1])
            # all_gossips << provisory
        end
        return all_gossips
    end
    def self.find(id)
        CSV.foreach("./db/gossip.csv").each_with_index do |csv_ligne, index|
            if id == index.to_s
                gossip_id_find = Gossip.new(csv_ligne[0], csv_ligne[1])
                # puts gossip_id_find.author
                # puts gossip_id_find.content
                return gossip_id_find
            end    
        end
    end
end
# Gossip.new("med", "test").save
# binding.pry
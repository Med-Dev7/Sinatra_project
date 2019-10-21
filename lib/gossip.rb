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
        end
        return all_gossips
    end
    def self.find(id)
        CSV.foreach("./db/gossip.csv").each_with_index do |csv_ligne, index|
            if id == index.to_s
                gossip_id_find = Gossip.new(csv_ligne[0], csv_ligne[1])
                return gossip_id_find
            end    
        end
    end
    def self.update(id, name, text)
        array = []
        CSV.open("./db/gossip.csv", "r+") do |data, index|
            CSV.foreach("./db/gossip.csv").each_with_index do |csv_ligne, index|
                if id == index.to_s            
                    data << ["#{name}", "#{text}"]
                else
                    data << csv_ligne
                end
            end
        end
    end

end
# Gossip.new("med", "test").save
# binding.pry
require_relative "room"

class Hotel
    # initializer
    def initialize(name, rooms)
        @name = name
        @rooms = {}

        rooms.each do |room, capacity|
            @rooms[room] = Room.new(capacity)
        end
    end

    # getters
    def name
        @name.split(" ").map(&:capitalize).join(" ")
    end

    def rooms
        @rooms
    end

    # instance methods
    def room_exists?(room_name)
        @rooms.has_key?(room_name)
    end

    def check_in(person, room_name)
        if self.room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                puts "check in successful!"
            else
                puts "sorry, room is full!"
            end
        else
            puts "sorry, room does not exist!"
        end
    end

    def has_vacancy?
        @rooms.values.any? { |room| !(room.full?) }
    end
    
    def list_rooms
        @rooms.each do |room_name, room|
            puts "#{room_name}: #{room.available_space}"
        end
    end
end

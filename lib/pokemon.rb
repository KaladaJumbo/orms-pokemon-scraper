require 'pry'
class Pokemon
    attr_reader :id, :db
    attr_accessor :name, :type

    def initialize (id: , name: ,type: , db:)

        @id = id
        @name = name
        @type = type
        @db = db

    end

    def self.save(name, type, db)

        sql = " INSERT INTO pokemon(name, type)
                values(?, ?)"

        db.execute(sql, name, type)

    end

    def self.from_db(row, db)

        new_pokemon = Pokemon.new(id: row[0], name: row[1], type: row[2], db: db)

    end

    def self.find(id, db)

        sql = "SELECT * FROM pokemon
            WHERE id = ?
            LIMIT 1"

        Pokemon.from_db(db.execute(sql, id)[0], db)

    end

end

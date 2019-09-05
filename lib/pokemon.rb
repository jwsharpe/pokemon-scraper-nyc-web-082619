class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db

  def initialize(attrs)
    @name = attrs[:name]
    @type = attrs[:type]
    @id = attrs[:id]
    @db = attrs[:db]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) values (?,?)", name, type)
    id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    Pokemon.new(name: name, type: type, id: id, db: db)
  end

  def self.find(id, db)
    attrs = db.execute("SELECT name, type FROM pokemon WHERE id=?", id).first
    name = attrs[0]
    type = attrs[1]
    Pokemon.new(name: name, type: type, id: id, db: db)
  end
end

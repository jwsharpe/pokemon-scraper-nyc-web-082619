require_relative "environment"

Scraper.new(@db).scrape

p all_pokemon = @db.execute("SELECT * FROM pokemon;")

# test out your code here!

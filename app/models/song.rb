
class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

   def song_title
      self.song.title
   end 

   def artist_name=(name)
    	artist = Artist.find_or_create_by(name: name)
    	self.artist = artist
   end 

   def artist_name
      self.artist.name if artist
   end 

   def genre_name=(name)
      genre = Genre.find_or_create_by(name: name)
      self.genre = genre
   end 

   def genre_name
    	self.genre.name if genre
   end 

  
   def note_contents
      self.notes.collect {|note| note.content} 

   end 

   def note_contents=(contents)
   
   		contents.each do |content|
   			if content.strip != ''
   				self.notes.build(content: content)

   			end 
   		end 
   end 

end
# connects notes and content 

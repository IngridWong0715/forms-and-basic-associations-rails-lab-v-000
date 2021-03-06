class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    # binding.pry
    self.artist = Artist.find_or_create_by(name: name)
    # binding.pry

  end

  def artist_name
    # binding.pry

    self.try(:artist).try(:name)
  end

### NOT NEEDED: SINCE WE'RE USING THE GENRE_ID ATTRIBUTE IN FORM

  # def genre_name=(name)
  #   binding.pry
  #   self.genre = Genre.find_or_create_by(name: name)
  # end
  #
  # def genre_name
  #   binding.pry
  #   self.genre.name if self.genre
  # end

  def note_contents=(contents)
    contents.each do |content|
      if !content.empty?
        note = Note.create(content: content)
        self.notes << note
      end
    end
  end


  def note_contents
    self.notes.collect {|note| note.content}
  end

end

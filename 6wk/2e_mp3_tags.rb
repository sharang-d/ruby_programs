class AudioTags
  attr_reader :details # for reading specific properties

  @@genres = ['Blues','ClassicRock','Country','Dance','Disco','Funk','Grunge','Hip-Hop','Jazz','Metal','NewAge','Oldies','Other','Pop','R&B','Rap','Reggae','Rock','Techno','Industrial','Alternative','Ska','DeathMetal','Pranks','Soundtrack','Euro-Techno','Ambient','Trip-Hop','Vocal','Jazz+Funk','Fusion','Trance','Classical','Instrumental','Acid','House','Game','SoundClip','Gospel','Noise','AlternRock','Bass','Soul','Punk','Space','Meditative','InstrumentalPop','InstrumentalRock','Ethnic','Gothic','Darkwave','Techno-Industrial','Electronic','Pop-Folk','Eurodance','Dream','SouthernRock','Comedy','Cult','Gangsta','Top40','ChristianRap','Pop/Funk','Jungle','NativeAmerican','Cabaret','NewWave','Psychadelic','Rave','Showtunes','Trailer','Lo-Fi','Tribal','AcidPunk','AcidJazz','Polka','Retro','Musical','Rock&Roll','HardRock','Folk','Folk-Rock','NationalFolk','Swing','FastFusion','Bebob','Latin','Revival','Celtic','Bluegrass','Avantgarde','GothicRock','ProgressiveRock','PsychedelicRock','SymphonicRock','SlowRock','BigBand','Chorus','EasyListening','Acoustic','Humour','Speech','Chanson','Opera','ChamberMusic','Sonata','Symphony','BootyBass','Primus','PornGroove','Satire','SlowJam','Club','Tango','Samba','Folklore','Ballad','PowerBallad','RhythmicSoul','Freestyle','Duet','PunkRock','DrumSolo','Acapella','Euro-House','DanceHall']

  def initialize file
    raise "#{file} does not exist." unless File.exist?(file)
    @file = file
    @details = {}
  end

  def check_tag
    File.open(@file) do |f|
      f.seek(-128, IO::SEEK_END)
      if f.read(3) == 'TAG'
        @details[:tag] = 'Valid ID3 tag'
        @details[:title] = f.read(30)
        @details[:artist] = f.read(30)
        @details[:album] = f.read(30)
        @details[:year] = f.read(4)
        @details[:comment] = f.read(30)
        @details[:genre] = @@genres.fetch(f.read(1).unpack('C')[0], 'Unknown')
      else
        @details[:tag] = 'ID3 Tag not present'
      end
    end
  end

  def to_s
    @details.map { |k, v| "#{k}: #{v}"}.join("\n")
  end

end
a = AudioTags.new 'raw/song.mp3'
a.check_tag
puts a

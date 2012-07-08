require 'rexml/document'

class SessionParser
  def self.list_audio_files(xml)
    doc = REXML::Document.new(xml)
    audio_files = []
    doc.elements.each('Session/Sources/Source') do |element|
      audio_files << element.attributes['name']
    end
    audio_files
  end

  def self.list_regions(xml)
    doc = REXML::Document.new(xml)
    regions = []
    doc.elements.each('Session/Regions/Region') do |element|
      regions << {:id => element.attributes['id'], :name => element.attributes['name']}
    end
    regions
  end
end

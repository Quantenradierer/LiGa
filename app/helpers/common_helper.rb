module CommonHelper
  def linessplit(text)
    text.split(/[\r\n]/).each do |line|
      yield line.gsub(/\x1b[^a-zA-Z]*[a-zA-Z]/, '').dup.force_encoding("UTF-8")
    end
  end
end

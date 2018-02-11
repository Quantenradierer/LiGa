require_relative 'conf'

class FileConf < Conf
  def get(key)
    @content
  end

  def set(key, value)
    @content = value
  end

  def load(game)
    File.open(File.join(game.path, 'serverfiles', @config.file)) do |handle|
      @content = handle.readlines.join
    end
  end

  def save(game)
    File.write(File.join(game.path, 'serverfiles', @config.file), @content)
  end
end

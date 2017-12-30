require_relative 'conf'

class FileConf < Conf
  def get(key)
    @content
  end

  def set(key, value)
    @content = value
  end

  def load(game)
    Dir.chdir(game.path) do
      File.open(@config.file) do |handle|
        @content = handle.readlines.join
      end
    end
  end

  def save(game)
    File.open(@config.file, 'wb') do |handle|
      handle.write(@content)
    end
  end
end

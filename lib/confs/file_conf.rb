class FileConf
  def initialize(path)
    @path = path
  end

  def get(key)
    raise NotImplementedError.new
  end
end
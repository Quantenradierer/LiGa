
class Conf
  def initialize(config)
    @config = config
  end

  def get(key)
    raise NotImplementedError
  end

  def set(key, value)
    raise NotImplementedError
  end

  def load; end

  def save; end
end
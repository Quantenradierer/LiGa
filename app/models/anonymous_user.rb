class AnonymousUser < User
  def email
    'anonymous'
  end

  def authenticated
    false
  end

  def roles?
    []
  end
end
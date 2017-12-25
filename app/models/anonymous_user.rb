class AnonymousUser < User
  def email
    'anonymous'
  end

  def authenticated
    false
  end

  def is_admin?
    false
  end
end
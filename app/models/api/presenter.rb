require 'delegate'

class Api::Presenter < SimpleDelegator
  def to_json(*args)
    serializable_hash(*args).to_json
  end

  def as_json(*args)
    serializable_hash(*args)
  end
end

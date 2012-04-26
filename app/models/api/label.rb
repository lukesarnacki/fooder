class Api::Label < Api::Presenter

  def self.find(id)
    new(Label.find(id))
  end

  def self.create!(*args, &block)
    new(Label.create!(*args))
  end
end


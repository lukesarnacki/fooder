class Api::Label < Api::Presenter

  def self.find(id)
    new(Label.find(id)).as_json
  end

  def as_json(*)
    {
      :content => content
    }
  end
end

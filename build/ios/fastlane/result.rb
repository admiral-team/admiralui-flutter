class ResultInfo
  attr_accessor :status
  attr_accessor :description
  def initialize(status, description)
    @status     = status
    @description   = description
  end
end

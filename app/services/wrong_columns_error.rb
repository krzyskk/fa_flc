class WrongColumnsError < StandardError
  def initialize(msg="Cannot find proper columns")
    super
  end
end
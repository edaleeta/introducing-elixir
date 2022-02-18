defprotocol Valid do
  @doc """
  Returns true if the data is considered nominally valid
  """
  def valid?(data)
end

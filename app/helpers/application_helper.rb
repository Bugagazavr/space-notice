module ApplicationHelper
  def request_base
    parts = []
    parts << request.scheme
    parts << '://'
    parts << request.host
    unless request.port == 80 || request.port == 443
      parts << ":"
      parts << request.port
    end 
    parts.join
  end
end

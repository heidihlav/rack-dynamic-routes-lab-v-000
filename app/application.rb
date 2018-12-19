class Application
  @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path == "/testing"
      resp.write "Testing"
    else
      resp.write "Route not found"
      resp.status = 404
    end

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
    end
    else
      resp.write "Item not found"
      resp.status = 400
    end
    resp.finish
    # if req.path.match (/testing/)
    #   @@items.each do |item|
    #     resp.write
    #
  end
end

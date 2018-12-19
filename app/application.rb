class Application
  @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)


    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item.price}\n"
    end
    else
      resp.write "Item not found"
      resp.status = 400
    end

    # if req.path == "/testing"
    #   resp.write "Testing"
    # else
    #   resp.write "Route not found"
    #   resp.status = 404
    # end

    resp.finish
  end
end

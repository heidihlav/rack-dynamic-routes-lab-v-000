class Application
  @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item.price}\n"
    else
      resp.write "Item not found"
      resp.status = 400
    end

    # this is ok else
    #   resp.write "Route not found"
    #   resp.status = 404
    # end
    resp.finish
  end
end

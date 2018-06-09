import asynchttpserver, asyncdispatch

var server = newAsyncHttpServer()
proc cb(req: Request) {.async.} =
  await req.respond(Http200, "hello, world!")

echo "server started at :3000"
waitFor server.serve(Port(3000), cb)

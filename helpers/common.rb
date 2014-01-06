require 'ostruct'

def task! name
  Rake::Task[name].invoke
end

def template(from, to, params = {})
  debug     = params[:debug]
  namespace = OpenStruct.new(params)
  erb       = File.read CAP3_ROOT + "/templates/#{from}"
  res       = ERB.new(erb).result(namespace.instance_eval { binding })
  puts "", ("! "*25), res, ("! "*25), "" if debug
  upload! StringIO.new(res), to
end
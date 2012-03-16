$: << "sail.rb/lib"
require 'sail/daemon'

require 'archivist'
require 'notetaker'

AGENT_PASSWORD = "agentspassword"

@daemon = Sail::Daemon.spawn(
  :name => "wallcology",
  :path => '.',
  :verbose => true
)

@daemon.load_config("../config.json")

# Chicago run - wallcology-lincoln-sp12
@daemon << Archivist.new(:room => "wallcology-lincoln-sp12", :password => AGENT_PASSWORD, :database => 'wallcology')
@daemon << Notetaker.new(:room => "wallcology-lincoln-sp12", :password => AGENT_PASSWORD, :database => 'common-knowledge')


@daemon.start

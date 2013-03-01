require 'foreman/export'

class Foreman::Export::Mongroup < Foreman::Export::Base
  def export
    error('Must specify a location') unless location

    mongroup = []
    mongroup << "pids = #{location}/tmp/pids"
    mongroup << "logs = #{log}"

    engine.each_process do |name, process|
      1.upto(engine.formation[name]) do |num|
        port = engine.port_for(process, num)

        commands = []
        commands << "cd #{engine.root}"
        commands << "export PORT=#{port}"
        engine.env.each_pair do |var, env|
          commands << "export #{var.upcase}=#{shell_quote(env)}"
        end
        commands << "#{process.command}"

        mongroup << "#{name}.#{num} = #{commands.join(" ; ")}"
      end
    end

    mongroup << "" # Add an empty line so our last process is detected

    write_file "mongroup.conf", mongroup.join("\n")
  end
end
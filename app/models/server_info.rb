require 'vmstat'

class ServerInfo < ActiveRecord::Base
  def as_json
    mem = Vmstat.memory
    total_mem = mem.active_bytes + mem.inactive_bytes + mem.free_bytes + mem.wired_bytes
    # Getting disk info for main partition is, temprorarily, for only
    # UN*X-like systems, such as GNU/Linux, BSD, Mac OS X etc.
    # Windows implementation will be added in future 
    disk = Vmstat.disk('/')
    # Model attributes will be added in future, in order to store in database
    { "CPU" => Vmstat.load_average.five_minutes,
      "Memory" => {
        "Total" => total_mem / 1024**2,
        "Used" => (total_mem - mem.free_bytes) / 1024**2
      },
      "Disk" => {
        "Total" => disk.total_bytes / 1024**2,
        "Used" => (disk.total_bytes - disk.free_bytes) / 1024**2
      },
      "Uptime" => (Time.now - Vmstat.boot_time).to_i / 60
    }.to_json
  end
end

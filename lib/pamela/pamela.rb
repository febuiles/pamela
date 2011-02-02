module Pamela
  def self.load(*args)
    args.flatten.each { |arg| self.send(arg) }
  end

  def self.spec
    require 'rspec/core/rake_task'

    file_list = FileList['spec/**/*_spec.rb']
    RSpec::Core::RakeTask.new('spec') do |t|
      t.pattern = file_list
      t.rspec_opts = ["--colour", "--format progress"]
    end
  end

  def self.test
    require 'rake/testtask'
    file_list = FileList['test/**/*test*.rb']
    Rake::TestTask.new do |t|
      t.libs << "test"
      t.test_files = file_list
    end
  end

  def self.console
    task :console do
      start_irb(self.app_name)
    end
  end

  def self.app_name
    rakefile_dir = Rake.application.find_rakefile_location.last
    name = rakefile_dir.split("/").last
    name or raise Exception, "Project name not found"
  end

  def self.start_irb(app_name)
    exec("irb -Ilib -r#{self.app_name}")
  end
end

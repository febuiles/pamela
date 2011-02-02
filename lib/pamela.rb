class Pamela
  def self.load(*args)
    args.each { |arg| self.send(arg) }
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
      exec("irb -Ilib -r#{self.app_name}")
    end
  end

  def self.app_name
    raise Exception, "Project name not found" if Dir.pwd == "/"

    if File.directory?(".git")
      Dir.pwd.split("/").last
    else
      Dir.chdir("..")
      self.app_name
    end
  end


  class << self
    alias_method :specs, :spec
    alias_method :use, :load
  end
end

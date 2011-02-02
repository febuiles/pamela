require 'test/unit'
require 'mocha'
require 'rake/testtask'
require 'rspec/core/rake_task'

require 'pamela'

class TestPamela < Test::Unit::TestCase
  # have yet to find a better way to test these first two
  def test_spec
    FileList.expects(:[]).with('spec/**/*_spec.rb')
    RSpec::Core::RakeTask.expects(:new).with('spec')
    Pamela.load :spec
  end

  def test_minitest
    FileList.expects(:[]).with('test/**/*test*.rb')
    Rake::TestTask.expects(:new)
    Pamela.load :test
  end

  def test_console
    Pamela.load :console
    task = Rake.application.tasks.first
    assert_equal task.name, "console"
    assert_not_nil task.actions
  end

  def test_app_name
    assert_equal Pamela.app_name, "pamela"
  end

  def test_app_name_exception
    Rake.application.expects(:find_rakefile_location).returns([nil, "/"])
    assert_raise(Exception){ Pamela.app_name }
  end

  def test_multiple_params
    Pamela.load :console, :test
    tasks = Rake.application.tasks
    names = tasks.map(&:name)
    assert_equal names, ["console", "test"]
  end
end

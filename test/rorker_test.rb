# frozen_string_literal: true

require "test_helper"

class RorkerTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Rorker::VERSION
  end

  def test_rorker_init
    task = Ractor.new{}
    rorker = Rorker.new(task)
    assert_kind_of Rorker, rorker
  end

  def test_rorker_run
    task = Ractor.new{
      Ractor.recv
    }
    rorker = Rorker.new(task)
    rorker.send(42)
    rorker.run{|worker, result|
      assert_kind_of Ractor, worker
      assert_equal 42, result
    }
  end
end

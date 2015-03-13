require 'test_helper'

class SignUpNotifierTest < ActionMailer::TestCase
  test "registrated" do
    mail = SignUpNotifier.registrated
    assert_equal "Registrated", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

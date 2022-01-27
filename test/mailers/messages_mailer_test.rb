require "test_helper"

class MessagesMailerTest < ActionMailer::TestCase
  test "submitted" do
    mail = MessagesMailer.submitted messages(:one)
    assert_equal "New message!", mail.subject
    assert_equal ["aazseck@gmail.com"], mail.to
    assert_equal ["aazseck@gmail.com"], mail.from
  end

end

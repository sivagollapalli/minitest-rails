require 'test_helper'

<% module_namespacing do -%>
class <%= class_name %>Test < MiniTest::Unit::TestCase
  # load_code_to_test_mailer

<% actions.each do |action| -%>
  def test_<%= action %>
    mail = <%= class_name %>.<%= action %>
    assert_equal <%= action.to_s.humanize.inspect %>, mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

<% end -%>
<% if actions.blank? -%>
  # def test_truth
  #   assert true
  # end
<% end -%>
end
<% end -%>
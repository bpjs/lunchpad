require 'mandrill'

class InvitationMailer

  attr_reader :mailer, :invitee_vars, :to_array, :global_vars

  def initialize(invitee_ids, group)
    @mailer = Mandrill::API.new
    @global_vars = [{ "name" => "CREATOR", "content" => group.creator.name}, {"name" => "RESTAURANT", "content" => group.restaurant.name}, {"name" => "TIME", "content" => group.show_time }]
    @invitee_vars = []
    @to_array = []
    invitee_ids.each do |id|
      member = Member.find(id)
      invitee_vars << { "rcpt" => member.email,
        "vars" => [{"name" => "NAME", "content" => member.name}, { "name" => "LINK", "content" => "http://localhost:3000/members/#{id}/join_group/#{group.id}" }] }
      to_array << {"email" => member.email,
        "name" => member.name,
        "type" => "to"
      }
    end
  end

  def send_invitations
    message = {
      "preserve_recipients" => false,
      "merge" => true,
      "global_merge_vars" => global_vars,
      "merge_vars" => invitee_vars,
      "to" => to_array
    }
    result = @mailer.messages.send_template('lunchpad_invitation', [], message)
  end

end
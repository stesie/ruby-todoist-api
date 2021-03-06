require "spec_helper"

describe Todoist::Service::Reminder do

  let(:client) { Todoist::Client.new("api_token") }
  let(:reminder_service) { described_class.new(client) }

  describe "creating a reminder" do
    let(:arguments) { resource_without_id('reminder') }

    it "can create a reminder" do
      expect{
        reminder_service.create(arguments)
      }.to change{ client.queue.length}.by(+1)

      expect(client.queue.last.type).to eq 'reminder_add'
      expect(client.queue.last.arguments).to eq arguments
    end

    it "create a reminder with custom tmp id" do
      expect{
        reminder_service.create(arguments, 'temporary id')
      }.to change{ client.queue.length}.by(+1)

      expect(client.queue.last.temp_id).to eq 'temporary id'
    end

    it "returns an reminder" do
      reminder = reminder_service.create(arguments, 'temporary id')
      expect(reminder.to_submittable_hash).to eq(arguments)
    end
  end
end
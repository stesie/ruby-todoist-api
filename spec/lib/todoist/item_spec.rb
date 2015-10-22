require "spec_helper"

describe Todoist::Item do
  it "can be built from json" do
    instance = described_class.new(json_response('item'))

    expect(instance.attributes).to eq({
      "id"=>33511505,
      "user_id"=>1855589,
      "project_id"=>128501470,
      "content"=>"Task1",
      "date_added" => "Fri 26 Sep 2014 08:25:05 +0000",
      "date_string"=>"",
      "date_lang"=>"en",
      "priority"=>1,
      "indent"=>1,
      "item_order"=>1,
      "labels" => [],
      "day_order"=>-1,
      "collapsed" => 0,
      "assigned_by_uid"=>1855589,
      "checked"=>0,
      "in_history"=>0,
      "is_deleted"=>0,
      "is_archived"=>0
      }
    )
  end
end
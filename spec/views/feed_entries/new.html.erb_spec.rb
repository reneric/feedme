require 'spec_helper'

describe "feed_entries/new" do
  before(:each) do
    assign(:feed_entry, stub_model(FeedEntry,
      :feed => nil,
      :name => "MyString",
      :summary => "MyText",
      :url => "MyString",
      :guid => "MyString"
    ).as_new_record)
  end

  it "renders new feed_entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", feed_entries_path, "post" do
      assert_select "input#feed_entry_feed[name=?]", "feed_entry[feed]"
      assert_select "input#feed_entry_name[name=?]", "feed_entry[name]"
      assert_select "textarea#feed_entry_summary[name=?]", "feed_entry[summary]"
      assert_select "input#feed_entry_url[name=?]", "feed_entry[url]"
      assert_select "input#feed_entry_guid[name=?]", "feed_entry[guid]"
    end
  end
end

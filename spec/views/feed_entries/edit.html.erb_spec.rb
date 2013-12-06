require 'spec_helper'

describe "feed_entries/edit" do
  before(:each) do
    @feed_entry = assign(:feed_entry, stub_model(FeedEntry,
      :feed => nil,
      :name => "MyString",
      :summary => "MyText",
      :url => "MyString",
      :guid => "MyString"
    ))
  end

  it "renders the edit feed_entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", feed_entry_path(@feed_entry), "post" do
      assert_select "input#feed_entry_feed[name=?]", "feed_entry[feed]"
      assert_select "input#feed_entry_name[name=?]", "feed_entry[name]"
      assert_select "textarea#feed_entry_summary[name=?]", "feed_entry[summary]"
      assert_select "input#feed_entry_url[name=?]", "feed_entry[url]"
      assert_select "input#feed_entry_guid[name=?]", "feed_entry[guid]"
    end
  end
end

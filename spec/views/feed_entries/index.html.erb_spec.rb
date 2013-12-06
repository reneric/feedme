require 'spec_helper'

describe "feed_entries/index" do
  before(:each) do
    assign(:feed_entries, [
      stub_model(FeedEntry,
        :feed => nil,
        :name => "Name",
        :summary => "MyText",
        :url => "Url",
        :guid => "Guid"
      ),
      stub_model(FeedEntry,
        :feed => nil,
        :name => "Name",
        :summary => "MyText",
        :url => "Url",
        :guid => "Guid"
      )
    ])
  end

  it "renders a list of feed_entries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Guid".to_s, :count => 2
  end
end

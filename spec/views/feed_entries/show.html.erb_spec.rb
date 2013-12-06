require 'spec_helper'

describe "feed_entries/show" do
  before(:each) do
    @feed_entry = assign(:feed_entry, stub_model(FeedEntry,
      :feed => nil,
      :name => "Name",
      :summary => "MyText",
      :url => "Url",
      :guid => "Guid"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Url/)
    rendered.should match(/Guid/)
  end
end

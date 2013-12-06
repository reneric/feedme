require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe FeedEntriesController do

  # This should return the minimal set of attributes required to create a valid
  # FeedEntry. As you add validations to FeedEntry, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "feed" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FeedEntriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all feed_entries as @feed_entries" do
      feed_entry = FeedEntry.create! valid_attributes
      get :index, {}, valid_session
      assigns(:feed_entries).should eq([feed_entry])
    end
  end

  describe "GET show" do
    it "assigns the requested feed_entry as @feed_entry" do
      feed_entry = FeedEntry.create! valid_attributes
      get :show, {:id => feed_entry.to_param}, valid_session
      assigns(:feed_entry).should eq(feed_entry)
    end
  end

  describe "GET new" do
    it "assigns a new feed_entry as @feed_entry" do
      get :new, {}, valid_session
      assigns(:feed_entry).should be_a_new(FeedEntry)
    end
  end

  describe "GET edit" do
    it "assigns the requested feed_entry as @feed_entry" do
      feed_entry = FeedEntry.create! valid_attributes
      get :edit, {:id => feed_entry.to_param}, valid_session
      assigns(:feed_entry).should eq(feed_entry)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new FeedEntry" do
        expect {
          post :create, {:feed_entry => valid_attributes}, valid_session
        }.to change(FeedEntry, :count).by(1)
      end

      it "assigns a newly created feed_entry as @feed_entry" do
        post :create, {:feed_entry => valid_attributes}, valid_session
        assigns(:feed_entry).should be_a(FeedEntry)
        assigns(:feed_entry).should be_persisted
      end

      it "redirects to the created feed_entry" do
        post :create, {:feed_entry => valid_attributes}, valid_session
        response.should redirect_to(FeedEntry.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved feed_entry as @feed_entry" do
        # Trigger the behavior that occurs when invalid params are submitted
        FeedEntry.any_instance.stub(:save).and_return(false)
        post :create, {:feed_entry => { "feed" => "invalid value" }}, valid_session
        assigns(:feed_entry).should be_a_new(FeedEntry)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        FeedEntry.any_instance.stub(:save).and_return(false)
        post :create, {:feed_entry => { "feed" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested feed_entry" do
        feed_entry = FeedEntry.create! valid_attributes
        # Assuming there are no other feed_entries in the database, this
        # specifies that the FeedEntry created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        FeedEntry.any_instance.should_receive(:update).with({ "feed" => "" })
        put :update, {:id => feed_entry.to_param, :feed_entry => { "feed" => "" }}, valid_session
      end

      it "assigns the requested feed_entry as @feed_entry" do
        feed_entry = FeedEntry.create! valid_attributes
        put :update, {:id => feed_entry.to_param, :feed_entry => valid_attributes}, valid_session
        assigns(:feed_entry).should eq(feed_entry)
      end

      it "redirects to the feed_entry" do
        feed_entry = FeedEntry.create! valid_attributes
        put :update, {:id => feed_entry.to_param, :feed_entry => valid_attributes}, valid_session
        response.should redirect_to(feed_entry)
      end
    end

    describe "with invalid params" do
      it "assigns the feed_entry as @feed_entry" do
        feed_entry = FeedEntry.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FeedEntry.any_instance.stub(:save).and_return(false)
        put :update, {:id => feed_entry.to_param, :feed_entry => { "feed" => "invalid value" }}, valid_session
        assigns(:feed_entry).should eq(feed_entry)
      end

      it "re-renders the 'edit' template" do
        feed_entry = FeedEntry.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FeedEntry.any_instance.stub(:save).and_return(false)
        put :update, {:id => feed_entry.to_param, :feed_entry => { "feed" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested feed_entry" do
      feed_entry = FeedEntry.create! valid_attributes
      expect {
        delete :destroy, {:id => feed_entry.to_param}, valid_session
      }.to change(FeedEntry, :count).by(-1)
    end

    it "redirects to the feed_entries list" do
      feed_entry = FeedEntry.create! valid_attributes
      delete :destroy, {:id => feed_entry.to_param}, valid_session
      response.should redirect_to(feed_entries_url)
    end
  end

end

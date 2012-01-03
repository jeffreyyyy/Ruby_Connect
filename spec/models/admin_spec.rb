require 'spec_helper'

describe Admin do
  
  before(:each) do
    @attr = { :name => "Jeffrey Jurgajtis", :email => "jeffrey@example.com" }
  end
  
  it "should create a new instance given a valid attribute" do
    Admin.create!(@attr)
  end
  
  it "should require a name" do
    no_name_admin = Admin.new(@attr.merge(:name => ""))
    no_name_admin.should_not be_valid
  end
  
  it "should require an email address" do
    no_email_admin = Admin.new(@attr.merge(:email => ""))
    no_email_admin.should_not be_valid
  end
  
  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_admin = Admin.new(@attr.merge(:name => long_name))
    long_name_admin.should_not be_valid
  end
  
  it "should accept valid email addresses" do
    addresses = %w[jeff@jeff.com JEFF_JEFF@jeff.jeff.com first.last@jeff.com]
    addresses.each do |address|
      valid_email_admin = Admin.new(@attr.merge(:email => address))
      valid_email_admin.should be_valid
    end
  end
  
  it "should reject invalid email addresses" do
    addresses = %w[jeff@jeff,com jeff_at_jeff.com jeff.jeffrey@com.]
    addresses.each do |address|
      invalid_email_admin = Admin.new(@attr.merge(:email => address))
      invalid_email_admin.should_not be_valid
    end
  end
  
  it "should reject duplicate email addresses" do
    Admin.create!(@attr)
    admin_with_duplicate_email = Admin.new(@attr)
    admin_with_duplicate_email.should_not be_valid
  end
  
  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    Admin.create!(@attr.merge(:email => upcased_email))
    admin_with_duplicate_email = Admin.new(@attr)
    admin_with_duplicate_email.should_not be_valid
  end
  
end











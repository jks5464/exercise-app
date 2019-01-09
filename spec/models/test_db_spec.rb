require 'rails_helper'

RSpec.describe TestDB do
  
=begin
  it "tests database connection" do
    params = { 
        :adapter  => "sqlite3",
        :database => "db/test"
    }
    ActiveRecord::Base.should_receive(:establish_connection).with(params)
    ActiveRecord::Base.should_receive(:clear_active_connections!)

  end
=end
  
=begin
  ActiveRecord::Base.connection.create_table :test_dbs do |subject|
=end
    subject {
    described_class.new(title: "Anything", description: "Lorem ipsum",
    start_date: DateTime.now, end_date: DateTime.now + 1.week)
  }
=begin
  end
=end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a start_date" do
    subject.start_date = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a end_date" do
    subject.end_date = nil
    expect(subject).to_not be_valid
  end
  
=begin
  ActiveRecord::Base.connection.drop_table :test_dbs
=end
  
end


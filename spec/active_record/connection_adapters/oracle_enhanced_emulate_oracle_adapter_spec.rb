require File.dirname(__FILE__) + '/../../spec_helper.rb'



describe "OracleEnhancedAdapter emulate OracleAdapter" do

  before(:all) do
    ActiveRecord::ConnectionAdapters.send(:remove_const, :OracleAdapter)
  end

  it "should be an OracleAdapter" do
    @conn = ActiveRecord::Base.establish_connection(:adapter => "oracle_enhanced",
                                            :database => "xe",
                                            :username => "hr",
                                            :password => "hr",
                                            :emulate_oracle_adapter => true)
    ActiveRecord::Base.connection.should_not be_nil
    ActiveRecord::Base.connection.is_a?(ActiveRecord::ConnectionAdapters::OracleAdapter).should be_true
  end

end

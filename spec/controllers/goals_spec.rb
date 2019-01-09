require_relative '../spec_helper'

describe 'GoalsController'  do
    describe 'valid_goal?' do
        before(:each) { @gc = GoalsController.new }
        it 'should be defined' do
            expect {@gc.valid_goal?("1", "Bench Press", "lbs", "Get Big", "", "50", "03/12/2019")}.not_to raise_error
        end
    end
    
    describe 'valid_user_id?' do
        before(:each) { @gc = GoalsController.new }
        
        it 'should return true for valid user_ids' do
            allow(User).to receive(:where).and_return([FactoryBot.build(:user)])
            expect(@gc.valid_user_id?("1")).to eq(true)
        end
        
        it 'should return false for invalid user_ids' do
            allow(User).to receive(:where).and_return(nil)
            expect(@gc.valid_user_id?("100")).to eq(false)
        end
    end
    
    describe 'valid_name?' do
        before(:each) { @gc = GoalsController.new }
        
        it 'should return true for valid names' do
            expect(@gc.valid_name?("Get Big")).to eq(true)
        end
        
        it 'should return false for invalid names' do
            expect(@gc.valid_name?("a"*50)).to eq(false)
        end
    end
    
    describe 'valid_exercise?' do
        before(:each) { @gc = GoalsController.new }
        
        it 'should return true when the exercise is found in the database' do
            allow(Exercise).to receive(:where).and_return([FactoryBot.build(:exercise)])
            expect(@gc.valid_exercise?("Bench Press")).to eq(true)
        end
        
        it 'should return false when the exercise is not found in the database' do
            allow(Exercise).to receive(:where).and_return(nil)
            expect(@gc.valid_exercise?("")).to eq(false)
        end
    end
    
    describe 'valid_unit?' do
        before(:each) { @gc = GoalsController.new }
        
        it 'should return true when the unit is found in the database' do
            allow(Unit).to receive(:where).and_return([FactoryBot.build(:unit)])
            expect(@gc.valid_unit?("lbs")).to eq(true)
        end
        
        it 'should return false when the unit is not found in the database' do
            allow(Unit).to receive(:where).and_return(nil)
            expect(@gc.valid_unit?("billy")).to eq(false)
        end
    end
    
    describe 'valid_description?' do
        before(:each) { @gc = GoalsController.new }
        
        it 'should return true for valid descriptions' do
            expect(@gc.valid_description?("")).to eq(true)
            expect(@gc.valid_description?("This goal means alot")).to eq(true)
        end
        
        it 'should return false for invalid descriptions' do
            expect(@gc.valid_description?("a"*200)).to eq(false)
        end
    end
    
    
    describe 'valid_value?' do
        before(:each) { @gc = GoalsController.new }
        
        it 'should return true for valid values' do
            expect(@gc.valid_value?("50")).to eq(true)
            expect(@gc.valid_value?("1000")).to eq(true)
            
        end
        
        it 'should return false for invalid values' do
            expect(@gc.valid_value?("")).to eq(false)
            expect(@gc.valid_value?("-")).to eq(false)
            expect(@gc.valid_value?("abce*")).to eq(false)
        end
    end
    
    describe 'valid_date?' do
        before(:each) { @gc = GoalsController.new }
        
        it 'should return true for valid dates' do
            expect(@gc.valid_date?("2019-03-12")).to eq(true)
        end
        
        it 'should return false for invalid values' do
            expect(@gc.valid_value?("Hello")).to eq(false)
            expect(@gc.valid_value?("")).to eq(false)
            expect(@gc.valid_value?("-")).to eq(false)
            expect(@gc.valid_value?("abce*")).to eq(false)
        end
    end
end
    

require 'action_controller'
require_relative '../app/controllers/application_controller'
require_relative '../app/controllers/measurements_controller'

describe 'MeasurementsController'  do
    describe 'valid_measurements?' do
        before(:each) { @mc = MeasurementsController.new }
        
        it 'should be defined' do
            expect {@mc.valid_measurements?([1, 2, 3])}.not_to raise_error
        end
        
        it 'returns true when all measurements are non negative numbers or empty strings' do
            expect(@mc.valid_measurements?([0, 1, 2])).to eq(true)
            
            expect(@mc.valid_measurements?([0.5, 1.5, 2.5])).to eq(true)
            
            expect(@mc.valid_measurements?(["0", "1", "2"])).to eq(true)
            
            expect(@mc.valid_measurements?(["", "1", "2"])).to eq(true)
            
            expect(@mc.valid_measurements?(["", "", "2"])).to eq(true)
        end
        
        it 'returns false when any measurements are negative numbers or all measurements are empty' do
            expect(@mc.valid_measurements?([-1, 0, 1])).to eq(false)
            
            expect(@mc.valid_measurements?(["-1", "0", "1"])).to eq(false)
            
            expect(@mc.valid_measurements?(["", "", ""])).to eq(false)
        end
        
        it 'returns false when any measurements are non numeric' do
            expect(@mc.valid_measurements?(["abc", "def", "ghi"])).to eq(false)
        
            expect(@mc.valid_measurements?(["a", "b", "c"])).to eq(false)
        end
    end
end
    
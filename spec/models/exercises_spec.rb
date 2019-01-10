require 'action_controller'
require_relative '../../app/controllers/application_controller'
require_relative '../../app/controllers/exercises_controller'

describe 'ExercisesController' do
    describe 'valid_exercises?' do
        before(:each) { @ec = ExercisesController.new }
        
        it 'should be defined' do
            expect {@ec.valid_exercises?(["Run", "Cardio"])}.not_to raise_error
        end
        
        it 'returns true when there are no numbers or special characters' do
            expect(@ec.valid_exercises?(["pull up", "Cardio"])).to eq(true)
            
            expect(@ec.valid_exercises?(["sit-up", "Strength"])).to eq(true)
            
            expect(@ec.valid_exercises?(["Push Up", "Strength"])).to eq(true)
            
            expect(@ec.valid_exercises?(["hush-Up", "Other"])).to eq(true)
            
        end
        
        it 'returns false when there are numbers or special characters' do
            expect(@ec.valid_exercises?(["12093jhdk6", "Cardio"])).to eq(false)
            
            expect(@ec.valid_exercises?(["$$$$lasd>%", "Strength"])).to eq(false)
            
            expect(@ec.valid_exercises?([81230904, "Other"])).to eq(false)
            
            expect(@ec.valid_exercises?(["", "Other"])).to eq(false)
            
        end
    end
end
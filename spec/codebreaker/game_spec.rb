require 'spec_helper'

module Codebreaker
  describe Game do
    let(:output) { double('output').as_null_object }
    let(:game)   { Game.new(output) }
    
    describe "#start" do
      it "sends a welcome message" do
        output.should_receive(:puts).with('Welcome to Codebreaker!')
        game.start('1234')
      end
 
      it "prompts for the first guess" do
        output.should_receive(:puts).with('Enter guess:')
        game.start('1234')
      end
    end

    describe "#guess" do
      it "sends the mark to output" do
        game.start('1234')
        output.should_receive(:puts).with('++++')
        game.guess('1234')
      end
    end
    

    describe "#game_finish" do
      it "sends 'Enter your name: ' " do
        #game.exact_match_count == 4
        output.should_receive(:print).with("Enter your name: ")
        #game.start('1234')
      end

      it "sends name when user enter name" do
        File.stub(:open)
        File.should_receive(:open).with("statistic_game.txt", "w+")
        File.stub(:read)
        File.should_receive(:read).with("statistic_game.txt")
      end
    end

%*
      context "with no matches" do
        it "sends a mark with ''" do 
          game.start('1234') 
          output.should_receive(:puts).with('') 
          game.guess('5555')
        end 
      end

      context "with 1 number match" do
        it "c'-'" do
          game.start('1234')
          output.should_receive(:puts).with('-')
          game.guess('2555')
        end
      end
      
      context "with 1 exact match" do
        it "sends a mark with '+'" do
          game.start('1234')
          output.should_receive(:puts).with('+')
          game.guess('1555')
        end
      end

      context "with 2 number matches" do
        it "sends a mark with '--'" do
          game.start('1234')
          output.should_receive(:puts).with('--')
          game.guess('2355')
        end
      end

      context "with 1 number match and 1 exact match (in that order)" do
        it "sends a mark with '+-'" do
          game.start('1234')
          output.should_receive(:puts).with('+-')
          game.guess('2535')
        end
      end*
    #end
  end
end
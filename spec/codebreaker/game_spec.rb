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

      it "call method game_finis" do
        output.stub(:game_finish) 
      end
    end

    describe "#game_finish" do
      xit "sends 'Enter your name: ' when game is over" do      
        output.should_receive(:print).with("Enter your name: ")
      end

      xit "call method to_file" do
        output.stub(:to_file)
      end

      xit "call method statistic" do
        output.stub(:statistic)
      end
    end

    describe "#to_file" do
      xit "sends information when user enter his name" do
        File.stub(:open)
        File.should_receive(:open).with("statistic_game.txt", "w+")
      end
    end

    describe "#statistic" do
      xit "displays information when the user has jump information" do
        File.stub(:read)
        File.should_rseceive(:read).with("statistic_game.txt")
      end
    end
  end
end
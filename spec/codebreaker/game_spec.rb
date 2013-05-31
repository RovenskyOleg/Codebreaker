require 'spec_helper'

module Codebreaker
  describe Game do
    let(:output) { double('output').as_null_object }
    let(:input) { double('input').as_null_object }
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
        Game.any_instance.stub(:game_finish)
        game.guess('1234')
      end
    end

    describe "#game_finish" do
      it "sends 'Enter your name: ' when game is over" do 
        output.should_receive(:puts).with('Enter your name: ')
        Game.any_instance.stub(:to_file)
        Game.any_instance.stub(:statistic)
        game.game_finish
      end

      it "exit" do
         lambda { output.game_finish; exit }.should raise_error(SystemExit)  
      end
    end

    describe "#to_file" do
      it "sends information when user enter his name" do
        File.stub(:open)
        File.should_receive(:open).with("statistic_game.txt", "w+")
        game.to_file("Viktor")
      end
    end

    describe "#statistic" do
      it "displays information when the user has jump information" do
        File.stub(:read)
        File.should_receive(:read).with("statistic_game.txt")
        game.statistic
      end
    end
  end
end
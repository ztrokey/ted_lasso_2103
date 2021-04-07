require 'pry'
require './lib/player'
require './lib/team'
require './lib/league'

RSpec.configure do |config|
  config.default_formatter = 'doc'
end

RSpec.describe "Ted Lasso Spec" do
  before :each do
    @roy = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})
    @sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
    @jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
    @fernanindho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})

    @richmond = Team.new("AFC Richmond", "Ted Lasso", [@roy, @sam])
    @manchester = Team.new("Manchester City FC", "Pep Guardiola", [@jamie, @fernandinho])

    @premier = League.new("Premier League")
  end

  describe 'iteration 1' do
    it '1. Player Instantiation' do
      expect(Player).to respond_to(:new).with(1).argument
      expect(@roy).to be_an_instance_of(Player)
    end

    it '2. Player name' do
      expect(@roy).to respond_to(:name).with(0).argument
      expect(@roy.name).to eq("Roy Kent")
    end

    it '3. Player position' do
      expect(@roy).to respond_to(:position).with(0).argument
      expect(@roy.position).to eq('Center Midfielder')
    end

    it '4. Player Salary' do
      expect(@roy).to respond_to(:salary).with(0).argument
      expect(@roy.salary).to eq(1000000)
    end
  end

  describe 'iteration 2' do
    it '1. Team Instantiation' do
      expect(Team).to respond_to(:new).with(3).argument
      expect(@richmond).to be_an_instance_of(Dealership)
    end

    it '2. Team Name' do
      expect(@richmond).to respond_to(:name).with(0).argument
      expect(@richmond.name).to eq('AFC Richmond')
    end

    it '3. Team Coach' do
      expect(@richmond).to respond_to(:coach).with(0).argument
      expect(@richmond.coach).to eq('Ted Lasso')
    end

    it '4. Team players' do
      expect(@richmond).to respond_to(:players).with(0).argument
      expect(@richmond.players).to eq([@roy, @sam])
    end

    it '5. Team Total Salary' do
      expect(@richmond).to respond_to(:total_salary).with(0).argument
      expect(@richmond.total_salary).to eq(1600000)
    end

    it '6. Team Captain' do
      expect(@richmond).to respond_to(:captain).with(0).argument
      expect(@richmond.captain).to eq('Roy Kent')
    end

    it '7. Team Positions Filled' do
      expect(@richmond).to respond_to(:positions_filled).with(0).argument
      expect(@richmond.positions_filled).to eq(['Center Midfielder', 'Right-back Defender'])
    end
  end

  describe 'iteration 3' do

    it '1. League Instantiation' do
      expect(League).to respond_to(:new).with(1).argument
      expect(@premier).to be_an_instance_of(League)
    end

    it '2. League Name' do
      expect(@premier).to respond_to(:name).with(0).argument
      expect(@premier.name).to eq('Premier League')
    end

    it '3. League starts with no teams' do
      expect(@premier).to respond_to(:teams).with(0).argument
      expect(@premier.teams).to eq([])
    end

    it '4. League can add teams' do
      @premier.add_team(@richmond)
      @premier.add_team(@manchester)
      expect(@premier.teams).to eq([@richmond, @manchester])
    end

    it '5. League captains' do
      @premier.add_team(@richmond)
      @premier.add_team(@manchester)
      expect(@premier).to respond_to(:captains).with(0).argument
      expect(@premier.captains).to eq([@roy, @fernandinho])
    end

    it '6. League players by team' do
      @premier.add_team(@richmond)
      @premier.add_team(@manchester)

      expected = {
        @richmond => ["Roy Kent", "Sam Obisanya"],
        @manchester => ["Jamie Tartt", "Fernandinho"]
      }

      expect(@premier).to respond_to(:players_by_team).with(0).argument
      expect(@premier.players_by_team).to eq(expected)
    end
  end

  describe 'iteration 4' do
    before :each do
      @premier.add_team(@richmond)
      @premier.add_team(@manchester)
    end

    it '1. League most expensive player' do
      expect(@premier).to respond_to(:most_expensive_player).with(0).argument
      expect(@premier.most_expensive_player).to eq(['Fernandinho'])
    end

    it '2. League players by salary range' do
      expected = {
      "Over 0M" => ["Sam Obisanya"],
      "Over 1M" => ["Roy Kent", "Jamie Tartt"],
      "Over 2M" => [],
      "Over 3M" => [],
      "Over 4M" => [],
      "Over 5M" => ["Fernandinho"],
    }
      expect(@premier).to respond_to(:players_by_salary_range).with(0).argument
      expect(@premier.players_by_salary_range).to eq(expected)
    end
  end
end


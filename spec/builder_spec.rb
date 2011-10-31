require 'spec_helper'

describe Turnip::Builder do
  context "with scenario outlines" do
    let(:gherkin) { File.read(File.expand_path('../examples/scenario_outline.feature', File.dirname(__FILE__))) }
    let(:builder) { Turnip::Builder.build(gherkin) }
    let(:feature) { builder.features.first }


    it "extracts scenarios" do
      feature.scenarios.map(&:name).should eq([
        'a simple outline',
        'a simple outline'
      ])
    end

    it "replaces placeholders in steps" do
      feature.scenarios[0].steps.should eq([
        "there is a monster with 10 hitpoints",
        "I attack the monster and do 13 points damage",
        "the monster should be dead"
      ])
      feature.scenarios[1].steps.should eq([
        "there is a monster with 8 hitpoints",
        "I attack the monster and do 5 points damage",
        "the monster should be alive"
      ])
    end
  end

  context "with step modules" do
    let(:gherkin) { File.read(File.expand_path('../examples/uses_step_modules.feature', File.dirname(__FILE__))) }
    let(:builder) { Turnip::Builder.build(gherkin) }
    let(:feature) { builder.features.first }

    it "extracts the step modules" do
      feature.step_modules[0].module_name.should eq('ferocious_attack')
    end
  end
end

require 'turnip/example_group'

describe Turnip::ExampleGroup do
  include Turnip::ExampleGroup

  describe '#execute_steps' do
    before { @available_steps = available_steps }

    let(:available_steps) { stub }
    let(:step) { stub }
    let(:steps) { [step] }

    it 'executes each step in the context' do
      Turnip::StepDefinition.should_receive(:execute).with(self, available_steps, step)
      execute_steps(steps)
    end
  end

  describe '#load_steps_for' do
    let(:steps) { stub }
    let(:tag1) { 'tag1' }
    let(:tag2) { 'tag2' }

    it 'loads the available steps into the context' do
      Turnip::StepModule.should_receive(:all_steps_for).with(tag1, tag2).and_return(steps)
      load_steps_for(tag1, tag2)
      @available_steps.should eq(steps)
    end
  end
end

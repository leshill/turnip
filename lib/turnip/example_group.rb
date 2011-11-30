module Turnip
  module ExampleGroup
    def execute_steps(steps)
      steps.each do |step|
        Turnip::StepDefinition.execute(self, available_steps, step)
      end
    end

    def load_steps_for(*tags)
      self.available_steps = Turnip::StepModule.all_steps_for(*tags)
    end

    private

    attr_accessor :available_steps
  end
end

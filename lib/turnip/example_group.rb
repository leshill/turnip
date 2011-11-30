module Turnip
  module ExampleGroup
    def execute_steps(steps)
      steps.each do |step|
        execute_step(step)
      end
    end

    def load_steps_for(*tags)
      self.available_steps = Turnip::StepModule.all_steps_for(*tags)
    end

    def step(description)
      execute_step(build_step(description))
    end

    private

    attr_accessor :available_steps

    def build_step(description)
      Turnip::Builder::Step.new(description, nil)
    end

    def execute_step(step)
      Turnip::StepDefinition.execute(self, available_steps, step)
    end
  end
end

require "rails_helper"
require "spec_helper"

RSpec.describe "todo:delete_items", type: :rake do
  let(:task_name) { "todo:delete_items" }

  it "is delete_items here" do
    expect(subject.name).to eq(task_name)
  end
end

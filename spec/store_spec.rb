require("spec_helper")

describe(Store) do
  it { should have_many(:relationships) }

  it { should have_many(:brands) }
end
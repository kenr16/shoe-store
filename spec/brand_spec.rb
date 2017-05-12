require("spec_helper")

describe(Brand) do
  it { should have_many(:relationships) }

  it { should have_many(:stores) }
end

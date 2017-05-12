require("spec_helper")

describe(Relationship) do
  it { should belong_to(:brand) }

  it { should belong_to(:store) }
end

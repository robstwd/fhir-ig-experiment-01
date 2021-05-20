@profile=""

Given('the generated {string} file of profile {string} exists') do |file_type, profile|
  @profile = profile
  expect(@profile).to have_generated_filetype(file_type)
end

Then('it has been derived from {string}') do |string|
  expect(@profile).to be_derived_from(string)
end

Then('{string} has must support set to true') do |element_name|
  expect(@profile).to have_must_support_set_to_true_for_element(element_name)
end

Then('{string} has cardinality {string}') do |element_name, cardinality|
  expect(@profile).to have_element_with_cardinality(element_name, cardinality)
end

Then('{string} has its default cardinality') do |element_name|
  expect(@profile).to have_element_with_default_cardinality(element_name)
end

Then('{string} has an invariant {string}') do |element_name, invariant|
  expect(@profile).to have_element_with_invariant(element_name, invariant)
end

Then('{string} is bound to {string} as {string}') do |element_name, valueset, strength|
  expect(@profile).to have_element_with_binding(element_name, valueset, strength)
end
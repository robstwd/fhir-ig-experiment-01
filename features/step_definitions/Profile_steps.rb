@profile=""

Given('the generated {string} file of profile {string} exists') do |file_type, profile|
  @profile = profile
  expect(@profile).to have_generated_filetype(file_type)
end

Then('it has been derived from {string}') do |resource|
  expect(@profile).to be_derived_from(resource)
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

Then('{string} has fixedString {string}') do |element_name, string|
  expect(@profile).to have_element_with_fixedString(element_name, string)
end

Then('{string} has fixedCode {string}') do |element_name, code|
  expect(@profile).to have_element_with_fixedCode(element_name, code)
end

Then('{string} has fixedUri {string}') do |element_name, uri|
  expect(@profile).to have_element_with_fixedUri(element_name, uri)
end

Given('{string} has fixedBoolean {string}') do |element_name, boolean|
  expect(@profile).to have_element_with_fixedBoolean(element_name, boolean)
end

Given('{string} has fixedCanonical {string}') do |element_name, canonical|
  expect(@profile).to have_element_with_fixedCanonical(element_name, canonical)
end
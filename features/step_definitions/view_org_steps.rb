
Given /the following organizations exist/ do |org_table|
  org_table.hashes.each do |org|
    Organization.create!(name: org['OName'], about: org['About'], email: org['Email'], password: org['Password'])
  end
end

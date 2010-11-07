
Fabricator(:membership_list)

Fabricator(:user) do
  login { Fabricate.sequence(:user) { |i| "user#{i}" } }
  email { Fabricate.sequence(:email) { |i| "user#{i}@example.com" } }
  password "test123"
  password_confirmation "test123"
  position {{:lat => 0, :long => 0}}

end

Fabricator(:group) do
  name { Fabricate.sequence(:name) { |i| "group#{i}" } }
  subdomain {|g|g.name}
  legend { Fabricate.sequence(:legend) { |i| "the test group #{i}" }}
  description {|g|"#{g.name} description" }
  default_tags {["testing"]}
  state "active"
  languages ["en", "es", "fr"]
  owner { Fabricate(:user) }
end

Fabricator(:question) do
  title { Fabricate.sequence(:title) { |i| "this is a generate question number #{i}?" } }
  position {{:lat => 0, :long => 0}}
  group!
  user!
end

Fabricator(:answer) do
  body { Fabricate.sequence(:body) { |i| "this is the answer number #{i}" } }
  position {{:lat => 0, :long => 0}}
  group!
  user!
  question!
end

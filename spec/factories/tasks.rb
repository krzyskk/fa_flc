FactoryBot.define do
  factory :task do
    name { "MyString" }
    description { "MyString" }
    start_time { "2019-11-02 22:43:46" }
    end_time { "2019-11-02 22:43:46" }
    color { "MyString" }
    priority { 1 }
    done { false }
    day { nil }
    finished_at { "2019-11-02 22:43:46" }
  end
end

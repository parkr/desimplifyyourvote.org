FactoryGirl.define do
  factory :response do
    ip_address = "192.168.1.1"
    user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.4 (KHTML, like Gecko) Chrome/22.0.1229.79 Safari/537.4"
    who = "obama"
  end
  factory :reason do
    critique = 'WHATEVER MAN YOU SHOULD KNOW'
    why = "It's all about love, man."
  end
end
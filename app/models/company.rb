class Company < ApplicationRecord
    has_one :selection
    enum aspiration: {"第一志望群": 1, "第二志望群": 2, "第三志望群": 3}
end

json.extract! company, :id, :category, :company_name, :aspiration, :mypage_url, :created_at, :updated_at
json.url company_url(company, format: :json)

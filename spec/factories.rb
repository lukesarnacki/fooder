FactoryGirl.define do
  factory :ingredient do
    grade { rand(1..10) }
    factory :ingredient_with_names do
      ignore do
        names_count 2
      end
      after_create do |ingredient, evaluator|
        FactoryGirl.create_list(:ingredient_name, evaluator.names_count, ingredient: ingredient)
        FactoryGirl.create_list(:main_ingredient_name, 1, ingredient: ingredient)
      end
    end
  end

  factory :ingredient_name do
    sequence(:name, 100) { |n| "E#{n}" }
    association :ingredient
    factory :main_ingredient_name do
      main true
    end
  end

  factory :company do
    name {"#{Faker::Product.brand}"}
  end

  factory :product do
    name {"#{Faker::Product.product_name}"}
    company
    factory :product_with_ingredients do

    end
  end
end

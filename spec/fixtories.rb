# encoding: UTF-8

Fixtories.define(:ingredient) do |f|
  f.create  :E339,
            number: "E339",
            grade: 5,
            description: "Fosforany sodu to regulatory kwasowości i czynniki chelatujące (wiązanie jonów metali). Zapobiegają wysychaniu, regulują kwasowość proszków oraz zapobiegają zbrylaniu się. Zwiększają wydajność przeciwutleniaczy."

  f.create  :E407,
            number: "E407",
            grade: 5,
            description: "Środek zagęszczający i stabilizator."
end

Fixtories.define(:ingredient_name) do |f|

  ###
  f.create  :fosforan_monosodowy,
            name: "Fosforan monosodowy",
            ingredient: f.ingredient(:E339)

  f.create  :fosforan_disodowy,
            name: "Fosforan disodowy",
            ingredient: f.ingredient(:E339)

  f.create  :fosforan_trisodowy,
            name: "Fosforan trisodowy",
            ingredient: f.ingredient(:E339)

  ###
  f.create  :kargen,
            name: "Kargen",
            ingredient: f.ingredient(:E407)

  f.create  :wodorost,
            name: "Przetworzony wodorost morski Eucheuma",
            ingredient: f.ingredient(:E407)
end

Fixtories.define(:company) do |f|

  f.create  :develey,
            :name => "Develey"

  f.create  :winiary,
            :name => "Winiary"

  f.create  :mlekpol,
            :name => "Mlekpol"

end

Fixtories.define(:product) do |f|
  f.create  :smietanka,
            name: "Śmietanka łaciata",
            company: f.company(:mlekpol),
            ingredients: [
              f.ingredient(:E339),
              f.ingredient(:E407)
            ]
end

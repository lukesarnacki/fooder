# encoding: UTF-8

Fixtories.define(:ingredient_name) do |f|

  ###
  f.create  :E339,
            name: "E339",
            main: true

  f.create  :fosforan_monosodowy,
            name: "Fosforan monosodowy"

  f.create  :fosforan_disodowy,
            name: "Fosforan disodowy"

  f.create  :fosforan_trisodowy,
            name: "Fosforan trisodowy"

  ###
  f.create  :E407,
            name: "E407",
            main: true

  f.create  :E407a,
            name: "E407a"

  f.create  :kargen,
            name: "Kargen"

  f.create  :wodorost,
            name: "Przetworzony wodorost morski Eucheuma"
end

Fixtories.define(:ingredient) do |f|
  f.create  :E339,
            names: [
              f.ingredient_name(:E339),
              f.ingredient_name(:fosforan_monosodowy),
              f.ingredient_name(:fosforan_disodowy),
              f.ingredient_name(:fosforan_trisodowy)
            ],
            grade: 5,
            description: "Fosforany sodu to regulatory kwasowości i czynniki chelatujące (wiązanie jonów metali). Zapobiegają wysychaniu, regulują kwasowość proszków oraz zapobiegają zbrylaniu się. Zwiększają wydajność przeciwutleniaczy."

  f.create  :E407,
            names: [
              f.ingredient_name(:E407),
              f.ingredient_name(:E407a),
              f.ingredient_name(:wodorost),
              f.ingredient_name(:kargen)
            ],
            grade: 5,
            description: "Środek zagęszczający i stabilizator."
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


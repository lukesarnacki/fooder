# encoding: UTF-8

Fixtories.define(:ingredient) do |f|
  f.create  :E339,
            number: "E339",
            grade: 5,
            description: "Fosforany sodu to regulatory kwasowości i czynniki chelatujące (wiązanie jonów metali). Zapobiegają wysychaniu, regulują kwasowość proszków oraz zapobiegają zbrylaniu się. Zwiększają wydajność przeciwutleniaczy.",
            origin: "Sole sodowe kwasu fosforowego. Naturalny składnik wielu owoców i warzyw. Na skalę rynkowa produkowany z fosforanu wydobywanego w USA.",
            products_type: "Wiele różnych produktów.",
            daily_intake: "Maksymalnie 70 mg/kg masy ciała.",
            side_effects: "Fosforany to sole niezbędne w organizmie. W celu ograniczenia ewentualnego niedoboru wapnia, należy ograniczyć spożycie fosforanów, ponieważ tworzą one związki chemiczne z wapniem. Nie wywołują efektów ubocznych.",
            dietary_restrictions: "Kwas fosforowy i fosforany mogą być spożywane przez wszystkie grupy religijne, wegan i wegetarian. Mimo, że kości zwierząt składają się w znacznej mierze z fosforanów, to nie są one z nich produkowane na skalę rynkową."


  f.create  :E407,
            number: "E407",
            grade: 5,
            description: "Środek zagęszczający i stabilizator.",
            origin: "Naturalny polisacharyd, wytwarzany przez wodorosty (Chrondrus crispus, Gigartina stellata, Euchema spinosum, E. cottonii) w Europie, Azji i Ameryce. Jest złożoną mieszaniną polisacharydów. E407a ma nieco inny skład; ponadto zawiera znaczne ilości celulozy.",
            products_type: "Wiele różnych produktów.",
            daily_intake: "Nie określono.",
            side_effects: "Nieznane, jeśli stosowany zgodnie z zaleceniami. W wysokich stężeniach może powodować wzdęcia (podobnie jak w przypadku innych, nietrawionych polisacharydów) powodowane fermentacją przez mikroflorę jelitową. Karageny o małej masie cząsteczkowej nie są dozwolone do stosowania w żywności, gdyż mogą wywołać owrzodzenia jelit.",
            dietary_restrictions: "Żadne; karageny mogą być spożywane przez wszystkie grupy religijne oraz wegan i wegetarian."
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

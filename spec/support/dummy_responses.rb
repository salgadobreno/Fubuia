# coding: utf-8
module DummyResponses

  def events_query
      JSON('[
        {
          "eid": 105417699523664,
          "name": "Fim do Mundo - Eu vou!",
          "creator": 1,
          "privacy": "OPEN",
          "location": "No mundo inteiro",
          "venue": {
            "street": "",
            "city": "",
            "state": "",
            "country": ""
          },
        "start_time": 1327622400,
        "end_time": 1327622400
        },
        {
          "eid": 226420880736785,
          "name": "CID, DOE SEU SALÁRIO!",
          "creator": 100001678599737,
          "privacy": "OPEN",
          "location": "Ceará",
          "venue": {
            "street": "",
            "city": "",
            "state": "",
            "country": ""
          },
          "start_time": 1328002200,
          "end_time": 1328013000
        },
        {
        "eid": 317163524988819,
        "name": "LONDON CALLING",
        "creator": 1,
        "privacy": "OPEN",
        "location": "Club 904 (Clube da ASCEB - 904 Sul)",
        "venue": {
          "street": "",
          "city": "",
          "state": "",
          "country": "",
          "latitude": -15.800694566667,
          "longitude": -47.900688083333,
          "id": 212762192067615
        },
        "start_time": 1327818600,
        "end_time": 1327840200
        },
        {
          "eid": 372742442742194,
          "name": "teste",
          "creator": 1,
          "privacy": "SECRET",
          "location": "Asd photographe",
          "venue": {
            "street": "",
            "city": "",
            "state": "",
            "country": "",
            "latitude": 48.508703720942,
            "longitude": 2.463682145747,
            "id": 242509969118609
          },
          "start_time": 1327586400,
          "end_time": 1327597200
        },
        {
          "eid": 228651767221196,
          "name": "Festa na Cobe do China",
          "creator": 1,
          "privacy": "SECRET",
          "location": "SQN 208 Bloco H",
          "venue": {
            "street": "",
            "city": "",
            "state": "",
            "country": ""
            },
          "start_time": 1327201200,
          "end_time": 1327217400
          }
      ]')
  end

  def multiquery
    {"event"=>
      [{"eid"=>12345,
        "name"=>"Fim do Mundo - Eu vou!",
        "creator"=>1,
        "privacy"=>"OPEN",
        "pic_small"=>
         "http://profile.ak.fbcdn.net/hprofile-ak-snc4/174576_105417699523664_1684222_t.jpg",
        "pic_big"=>
         "http://profile.ak.fbcdn.net/hprofile-ak-snc4/50236_105417699523664_1798087_n.jpg",
        "location"=>"No mundo inteiro",
        "venue"=>{"street"=>"", "city"=>"", "state"=>"", "country"=>""},
        "start_time"=>1327622400,
        "end_time"=>1327622400}],
     "creator"=>
        [{"name"=>"Breno Salgado",
          "pic_small"=>
           "x.jpg",
          "profile_url"=>"http://www.facebook.com/breno.salgado"}]}
  end

  def rio_events
    { "results" =>
      [{"name"=>"Vampire Weekend", "description"=>
       {"text"=>"A banda novaiorquina formada em 2006 far\u001835 uma s\u009Ca9rie de shows no paÜees. Com Ezra Koenig nos vocais e na guitarra, Rostam Batmanglij no teclado e guitarra, Chris Tomson na bateria e Chris Baio no baixo, a banda tem entre suas faixas mais conhecidas \"A-punk\" e \"Oxford Comma\"."}, "characteristics"=>{"lgbt"=>0, "start_date"=>"2011-02-03T00:00:00", "end_date"=>"2011-02-03T00:00:00", "local"=>"Rio de Janeiro - Circo Voador"}, "files"=>[{"file"=>"http://www.rioguiaoficial.com.br/sites/default/files/rio_vampire_weekend_circo_voador_show_credito_divulgacao.jpg"}], "geoResult"=>{"point"=>{"lat"=>-22.912824, "lng"=>-43.180904}}},
         {"name"=>"Ensaio das Escolas de Samba", "description"=>{"short_text"=>" ", "text"=>"As\nexibi}65?es ser;e0o sempre aos s\u0018a1bados e domingos e a entrada ser\u0012a6\nfranca. Cada agremiaxef;e0o da elite ensaiar\u001824 duas vezes, enquanto as\ndemais, apenas uma."}, "contactData"=>{"email"=>"liesarj@liesa.com.br", "website"=>"http://liesa.globo.com/", "phone"=>"55 (21)  3213.5151"}, "characteristics"=>{"lgbt"=>0, "start_date"=>"2011-02-05T00:00:00", "end_date"=>"2011-02-05T00:00:00", "organization"=>"LIESA", "local"=>"Samb?dromo da Marqu¬e0s de SapucaÐ00"}, "files"=>[{"file"=>"http://www.rioguiaoficial.com.br/sites/default/files/sapucai.jpg"}], "geoResult"=>{"point"=>{"lat"=>-22.910314, "lng"=>-43.197126}}},
         {"name"=>"LCD Soundsystem", "description"=>{"short_text"=>"LCD Soundsystem\n", "text"=>"A\r\nbanda de eletro-punk criado pelo novaiorquino James Murphy far\u001835 uma\r\napresentaxef;e0o no Rio, no dia 17 de fevereiro. As entradas custam entre\r\nR$ 240 (pista) e R$ 400 (camarote premium)."}, "contactData"=>{"email"=>"http://vivorio.com.br/", "website"=>"http://vivorio.com.br/contatos.asp", "phone"=>"(21) 2272- 2919. "}, "characteristics"=>{"lgbt"=>0, "start_date"=>"2011-02-17T00:00:00", "end_date"=>"2011-02-17T00:00:00", "organization"=>"Vivo Rio", "local"=>"Vivo Rio"}, "files"=>[{"file"=>"http://www.rioguiaoficial.com.br/sites/default/files/lcd_soundsystem.jpg"}], "geoResult"=>{"point"=>{"lat"=>-22.914069, "lng"=>-43.172429}}}
    ]}
  end

end

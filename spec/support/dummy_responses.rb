# coding: utf-8
module DummyResponses

  def events_query
      JSON('[
        {
          "eid": 105417699523664,
          "name": "Fim do Mundo - Eu vou!",
          "description": "OpenBar até o último cliente.",
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
        "description" => "OpenBar até o último cliente.",
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

end

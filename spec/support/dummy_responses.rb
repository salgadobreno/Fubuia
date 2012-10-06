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
        "start_time": "2012-01-26T22:00:00-02:00",
        "end_time": "2012-01-26T22:00:00-02:00"
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
          "start_time": "2012-01-31T07:30:00-02:00",
          "end_time": "2012-01-31T10:30:00-02:00"
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
        "start_time": "2012-01-29T04:30:00-02:00",
        "end_time": "2012-01-29T10:30:00-02:00"
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
          "start_time": "2012-01-26T12:00:00-02:00",
          "end_time": "2012-01-26T15:00:00-02:00"
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
          "start_time": "2012-01-22T01:00:00-02:00",
          "end_time": "2012-01-22T05:30:00-02:00"
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
       "start_time"=>"2012-01-26T22:00:00-02:00",
       "end_time"=>"2012-01-26T22:00:00-02:00"}],
       "creator"=>
     [{"name"=>"Breno Salgado",
       "pic_small"=>
     "x.jpg",
       "profile_url"=>"http://www.facebook.com/breno.salgado"}]}
  end

  def fubevents
    JSON(
      '[{
        "eid": 11,
        "name": "Good Bye Facebook.",
        "creator": null,
        "privacy": "OPEN",
        "pic_small": "http://profile.ak.fbcdn.net/hprofile-ak-snc6/261178_282928705156573_1060948663_n.jpg",
        "pic_big": "http://profile.ak.fbcdn.net/hprofile-ak-snc6/261178_282928705156573_1060948663_n.jpg",
        "location": null,
        "venue": [
        ],
        "start_time": "2012-10-05",
        "end_time": null
      },
      {
        "eid": 22,
        "name": "Quinta (04/10) 5uinto c/ Wildkats (Hot Creations/Inglaterra)",
        "creator": 151166391585616,
        "privacy": "OPEN",
        "pic_small": "http://profile.ak.fbcdn.net/hprofile-ak-ash4/203561_290935981021454_1452509486_n.jpg",
        "pic_big": "http://profile.ak.fbcdn.net/hprofile-ak-ash4/203561_290935981021454_1452509486_n.jpg",
        "location": "Club 904 (Clube da ASCEB - 904 Sul)",
        "venue": {
          "id": 212762192067615
        },
        "start_time": "2012-10-04T22:00:00-0300",
        "end_time": null
      },
      {
        "eid": 33,
        "name": "Tributo ao Led Zeppelin (Whole Lotta Led) & Beladita Maldona",
        "creator": 100000377043343,
        "privacy": "OPEN",
        "pic_small": "http://profile.ak.fbcdn.net/hprofile-ak-snc7/373158_425965267461184_1555052634_n.jpg",
        "pic_big": "http://profile.ak.fbcdn.net/hprofile-ak-snc7/373158_425965267461184_1555052634_n.jpg",
        "location": "Velvet Pub",
        "venue": {
          "id": 172371102815700
        },
        "start_time": "2012-10-04",
        "end_time": null
      },
      {
        "eid": 44,
        "name": "COVER NIGHT :: OASIS + THE KILLERS :: DIA 04/10",
        "creator": 100002340451025,
        "privacy": "OPEN",
        "pic_small": "http://profile.ak.fbcdn.net/hprofile-ak-ash4/211101_475839089123532_2038471914_n.jpg",
        "pic_big": "http://profile.ak.fbcdn.net/hprofile-ak-ash4/211101_475839089123532_2038471914_n.jpg",
        "location": "ORilley Irish Pub (409 sul)",
        "venue": {
          "name": "ORilley Irish Pub (409 sul)"
        },
        "start_time": "2012-10-04",
        "end_time": null
      },
      {
        "eid": 55,
        "name": "LIFE - 29.09 - ** Tributo a Mamonas Assassinas**",
        "creator": 100002068784255,
        "privacy": "OPEN",
        "pic_small": "http://profile.ak.fbcdn.net/hprofile-ak-snc6/276823_278377805595894_1692876072_n.jpg",
        "pic_big": "http://profile.ak.fbcdn.net/hprofile-ak-snc6/276823_278377805595894_1692876072_n.jpg",
        "location": "Enchendo Linguica",
        "venue": {
          "id": 162013987186580
        },
        "start_time": "2012-10-29T22:30:00-0300",
        "end_time": "2012-10-30T05:00:00-0300"
      }]'
    )
  end

  [{"eid"=>105417699523664,
    "name"=>"Fim do Mundo - Eu vou!",
    "creator"=>770689699,
    "privacy"=>"OPEN",
    "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash3/174576_105417699523664_1684222_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash3/50236_105417699523664_1798087_n.jpg",
    "location"=>"No mundo inteiro",
    "venue"=>{"street"=>"", "city"=>"", "state"=>"", "country"=>""},
    "start_time"=>"2012-12-21T00:00:00",
    "end_time"=>"2012-12-21T21:30:00"},
    {"eid"=>209093872529307,
     "name"=>"Mahamudra 2012",
     "creator"=>100001718282505,
     "privacy"=>"OPEN",
     "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/373318_209093872529307_167300439_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/373318_209093872529307_167300439_n.jpg",
    "location"=>"Brasília",
    "venue"=>{"id"=>112060958820146},
    "start_time"=>"2012-11-17T22:00:00-0200",
    "end_time"=>nil},
    {"eid"=>409054419159603,
     "name"=>"Crucified Barbara ( Suécia ) em Brasília!!!",
     "creator"=>580794414,
     "privacy"=>"OPEN",
     "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/276787_409054419159603_1279025964_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/276787_409054419159603_1279025964_n.jpg",
    "location"=>"Arena Futebol Clube",
    "venue"=>{"id"=>400754403299330},
    "start_time"=>"2012-11-11T21:00:00+0000",
    "end_time"=>"2012-11-12T02:00:00+0000"},
    {"eid"=>143493079124790,
     "name"=>"Kiara Rocks em Brasília.",
     "creator"=>100002087911178,
     "privacy"=>"OPEN",
     "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/203533_143493079124790_814593950_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/203533_143493079124790_814593950_n.jpg",
    "location"=>"Brasília",
    "venue"=>{"id"=>112060958820146},
    "start_time"=>"2012-10-27",
    "end_time"=>nil},
    {"eid"=>472774986066510,
     "name"=>"Pleiadians",
     "creator"=>476118485745305,
     "privacy"=>"OPEN",
     "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/373477_472774986066510_941623622_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/373477_472774986066510_941623622_n.jpg",
    "location"=>"Brasília",
    "venue"=>{"id"=>112060958820146},
    "start_time"=>"2012-10-13T22:00:00-0300",
    "end_time"=>nil},
    {"eid"=>462452360451994,
     "name"=>"Ritual",
     "creator"=>1082750743,
     "privacy"=>"OPEN",
     "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/276536_462452360451994_2041926586_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/276536_462452360451994_2041926586_n.jpg",
    "location"=>nil,
    "venue"=>[],
    "start_time"=>"2012-10-13T10:00:00-0300",
    "end_time"=>"2012-10-14T18:00:00-0300"},
    {"eid"=>278377805595894,
     "name"=>"LIFE - 29.09 - ** Tributo a Mamonas Assassinas**",
     "creator"=>100002068784255,
     "privacy"=>"OPEN",
     "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/276823_278377805595894_1692876072_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/276823_278377805595894_1692876072_n.jpg",
    "location"=>"Enchendo Linguica",
    "venue"=>{"id"=>162013987186580},
    "start_time"=>"2012-09-29T22:30:00-0300",
    "end_time"=>"2012-09-30T05:00:00-0300"},
    {"eid"=>374832812584857,
     "name"=>
  "::STAGE:: Pink Floyd, Led Zeppelin e The Doors (covers) :: Dia 29/09",
    "creator"=>100003226216034,
    "privacy"=>"OPEN",
    "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/195775_374832812584857_709941527_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/195775_374832812584857_709941527_n.jpg",
    "location"=>"Arena Futebol Clube",
    "venue"=>{"id"=>203531242990250},
    "start_time"=>"2012-09-30T01:00:00+0000",
    "end_time"=>nil},
    {"eid"=>361154357299405,
     "name"=>
  "PLAY! ** Edição Especial ** comemorando o aniversário dos djs Maraskin, Ruiz Lopes, R@g e Mr. Vicz",
    "creator"=>100000379203720,
    "privacy"=>"OPEN",
    "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/276733_361154357299405_727239819_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/276733_361154357299405_727239819_n.jpg",
    "location"=>"Club 904 (Clube da ASCEB - 904 Sul)",
    "venue"=>{"id"=>212762192067615},
    "start_time"=>"2012-09-28T22:30:00-0300",
    "end_time"=>"2012-09-29T04:30:00-0300"},
    {"eid"=>264442383676733,
     "name"=>
  "Quinta (27/09) 5uinto c/ Danny Daze (Hot Creations/EUA), Hopper e Mari Perrelli",
    "creator"=>151166391585616,
    "privacy"=>"OPEN",
    "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/276732_264442383676733_379558804_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/276732_264442383676733_379558804_n.jpg",
    "location"=>"Club 904 (Clube da ASCEB - 904 Sul)",
    "venue"=>{"id"=>212762192067615},
    "start_time"=>"2012-09-27T22:00:00-0300",
    "end_time"=>nil},
    {"eid"=>262027897252207,
     "name"=>"PANCADARIA FEST HARDCORE INSIDE",
     "creator"=>100002631912270,
     "privacy"=>"FRIENDS",
     "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/261162_262027897252207_1045732256_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/261162_262027897252207_1045732256_n.jpg",
    "location"=>"BAR DA TOINHA",
    "venue"=>{"id"=>191898444193767},
    "start_time"=>"2012-09-23T17:00:00-0300",
    "end_time"=>nil},
    {"eid"=>420176171363071,
     "name"=>"Mixtape - Edição Cinema",
     "creator"=>1049777208,
     "privacy"=>"OPEN",
     "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/195779_420176171363071_1054064799_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/195779_420176171363071_1054064799_n.jpg",
    "location"=>"Arena Futebol Clube",
    "venue"=>{"id"=>400754403299330},
    "start_time"=>"2012-09-22T22:00:00-0300",
    "end_time"=>"2012-09-23T05:00:00-0300"},
    {"eid"=>179542028841754,
     "name"=>
  "Dia Mundial Pelo Fim da Crueldade e Exploração dos Animais - Weeac Brasília",
    "creator"=>268512176492431,
    "privacy"=>"OPEN",
    "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/276419_179542028841754_1077961432_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/276419_179542028841754_1077961432_n.jpg",
    "location"=>"Fonte da Torre de TV de Brasilia",
    "venue"=>{"id"=>214516298599386},
    "start_time"=>"2012-09-22T15:00:00-0300",
    "end_time"=>"2012-09-22T19:00:00-0300"},
    {"eid"=>355802994499151,
     "name"=>"**** O BLOCO do  CABARÉ ROLÊ **** LET'S CLASSIC BABY !!!!!",
     "creator"=>100000220237313,
     "privacy"=>"OPEN",
     "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/195795_355802994499151_1404063488_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/195795_355802994499151_1404063488_n.jpg",
    "location"=>"Clube Minas Brasília Tênis Clube",
    "venue"=>{"id"=>187232997990079},
    "start_time"=>"2012-09-22T02:00:00+0000",
    "end_time"=>nil},
    {"eid"=>368603756547880,
     "name"=>"PLAY!** com dj set de BÁRBARA EUGÊNIA",
     "creator"=>100000379203720,
     "privacy"=>"OPEN",
     "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/203503_368603756547880_890261331_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/203503_368603756547880_890261331_n.jpg",
    "location"=>"Club 904 (Clube da ASCEB - 904 Sul)",
    "venue"=>{"id"=>212762192067615},
    "start_time"=>"2012-09-21T22:30:00-0300",
    "end_time"=>"2012-09-22T04:30:00-0300"},
    {"eid"=>371970799539447,
     "name"=>"BLOOD BROTHERS II",
     "creator"=>100001773230198,
     "privacy"=>"OPEN",
     "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/276548_371970799539447_854659243_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/276548_371970799539447_854659243_n.jpg",
    "location"=>"Blues Pub",
    "venue"=>{"id"=>228062383925250},
    "start_time"=>"2012-09-21T20:00:00+0200",
    "end_time"=>nil},
    {"eid"=>527227067293029,
     "name"=>
  "Quinta (20/09) 5uinto c/ Christian Smith (Tronic/Suécia), Uone (LAB/Austrália) e Komka",
    "creator"=>151166391585616,
    "privacy"=>"OPEN",
    "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/203476_527227067293029_2106948067_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/203476_527227067293029_2106948067_n.jpg",
    "location"=>"Club 904 (Clube da ASCEB - 904 Sul)",
    "venue"=>{"id"=>212762192067615},
    "start_time"=>"2012-09-21T01:00:00+0000",
    "end_time"=>nil},
    {"eid"=>528435920505051,
     "name"=>"The Baggios direto de Sergipe nesta quinta!",
     "creator"=>153478891439654,
     "privacy"=>"OPEN",
     "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/373463_528435920505051_1710242523_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/373463_528435920505051_1710242523_n.jpg",
    "location"=>"Cult 22 Rock Bar",
    "venue"=>{"id"=>108634782560341},
    "start_time"=>"2012-09-21T01:00:00+0000",
    "end_time"=>nil},
    {"eid"=>102145739936484,
     "name"=>
  "Sábado (15/09) 5uinto & My House apresentam: Inminimax Records & Crunchy Music - 4 anos",
    "creator"=>151166391585616,
    "privacy"=>"OPEN",
    "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/276944_102145739936484_1485003565_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/276944_102145739936484_1485003565_n.jpg",
    "location"=>"Ascade",
    "venue"=>{"id"=>268684499841296},
    "start_time"=>"2012-09-15T23:00:00-0300",
    "end_time"=>nil},
    {"eid"=>474703122562064,
     "name"=>"VAMO BEBER NA PRAÇA!",
     "creator"=>1845948167,
     "privacy"=>"OPEN",
     "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/592181_474703122562064_1391707995_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/592181_474703122562064_1391707995_n.jpg",
    "location"=>"QE 17 Guará II",
    "venue"=>{"id"=>211584525531131},
    "start_time"=>"2012-09-15T22:10:00-0300",
    "end_time"=>nil},
    {"eid"=>424723947574352,
     "name"=>":: OASIS DAY 2012 :: BRASÍLIA :: 15/09",
     "creator"=>100002340451025,
     "privacy"=>"OPEN",
     "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc7/373592_424723947574352_980419142_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc7/373592_424723947574352_980419142_n.jpg",
    "location"=>"Club 904 (Clube da ASCEB - 904 Sul)",
    "venue"=>{"id"=>212762192067615},
    "start_time"=>"2012-09-15T22:00:00-0300",
    "end_time"=>nil},
    {"eid"=>221711854624659,
     "name"=>
  "HOJE :: Queens of the Stone Age e The Strokes no GATE'S PUB!!!  \\m/",
    "creator"=>100003436557568,
    "privacy"=>"OPEN",
    "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/592205_221711854624659_1234610015_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/592205_221711854624659_1234610015_n.jpg",
    "location"=>"Gate's",
    "venue"=>{"id"=>225915977488908},
    "start_time"=>"2012-09-15T22:00:00-0300",
    "end_time"=>nil},
    {"eid"=>219509361509748,
     "name"=>"Festa a Fantasia e sensualismo",
     "creator"=>623630699,
     "privacy"=>"SECRET",
     "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/276726_219509361509748_1192967130_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/276726_219509361509748_1192967130_n.jpg",
    "location"=>"terra da perdição",
    "venue"=>{"name"=>"terra da perdição"},
    "start_time"=>"2012-09-15T22:00:00-0300",
    "end_time"=>"2012-09-16T04:00:00-0300"},
    {"eid"=>188823981221605,
     "name"=>"FESTA SHAMBALLA 2012",
     "creator"=>1461154272,
     "privacy"=>"OPEN",
     "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/187976_188823981221605_1714351879_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/187976_188823981221605_1714351879_n.jpg",
    "location"=>"fazenda encontro das águas",
    "venue"=>{"street"=>"", "city"=>"", "state"=>"", "country"=>""},
    "start_time"=>"2012-09-15T16:00:00",
    "end_time"=>"2012-09-16T16:00:00"},
    {"eid"=>434005603302263,
     "name"=>"Sexta do FODA-SE",
     "creator"=>1787157911,
     "privacy"=>"OPEN",
     "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/373350_434005603302263_1076695862_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/373350_434005603302263_1076695862_n.jpg",
    "location"=>"UnB - Teatro de Arena",
    "venue"=>{"id"=>153641591370997},
    "start_time"=>"2012-09-14T22:45:00-0300",
    "end_time"=>"2012-09-15T04:00:00-0300"},
    {"eid"=>104143809739793,
     "name"=>
  "PLAY!** com dj set de Rafael Farret & Gabriel Coaracy (ex-Bois de Gerião/DF)",
    "creator"=>100000379203720,
    "privacy"=>"OPEN",
    "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/276819_104143809739793_524216595_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/276819_104143809739793_524216595_n.jpg",
    "location"=>"Club 904 (Clube da ASCEB - 904 Sul)",
    "venue"=>{"id"=>212762192067615},
    "start_time"=>"2012-09-14T22:30:00-0300",
    "end_time"=>"2012-09-15T04:30:00-0300"},
    {"eid"=>415347068525724,
     "name"=>
  "DEU SAMBA - Nesta Sexta (14/09) - Edição de Aniversariantes do Mês na AABB",
    "creator"=>184910224918656,
    "privacy"=>"OPEN",
    "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/373084_415347068525724_1817854547_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/373084_415347068525724_1817854547_n.jpg",
    "location"=>"AABB - Brasília",
    "venue"=>{"id"=>120049138070742},
    "start_time"=>"2012-09-14T22:00:00-0300",
    "end_time"=>"2012-09-15T05:00:00-0300"},
    {"eid"=>479283122090259,
     "name"=>"É UNDER!!!!",
     "creator"=>100004242275716,
     "privacy"=>"OPEN",
     "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/276879_479283122090259_1666111214_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/276879_479283122090259_1666111214_n.jpg",
    "location"=>"UnB Subsolo - ICC SUL (ao lado do CANTRO E CAQUI)",
    "venue"=>{"name"=>"UnB Subsolo - ICC SUL (ao lado do CANTRO E CAQUI)"},
    "start_time"=>"2012-09-14T22:00:00-0300",
    "end_time"=>nil},
    {"eid"=>412467852135173,
     "name"=>
  "Acústico Rolla Pedra 14/09 - Brasília - Henry Paul Trio (SP), Bad Motors (SP) e Os Dinamites",
    "creator"=>248975248507501,
    "privacy"=>"OPEN",
    "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/276891_412467852135173_1185882504_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/276891_412467852135173_1185882504_n.jpg",
    "location"=>"Funarte",
    "venue"=>{"id"=>213170942040282},
    "start_time"=>"2012-09-14T20:00:00-0300",
    "end_time"=>nil},
    {"eid"=>118663434947435,
     "name"=>"Quinta (13/09) 5uinto c/ Maxxi Soundsystem (Hot Waves/Inglaterra)",
     "creator"=>151166391585616,
     "privacy"=>"OPEN",
     "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/211080_118663434947435_230537516_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-snc6/211080_118663434947435_230537516_n.jpg",
    "location"=>"Club 904 (Clube da ASCEB - 904 Sul)",
    "venue"=>{"id"=>212762192067615},
    "start_time"=>"2012-09-13T22:00:00-0300",
    "end_time"=>nil},
    {"eid"=>113777585438869,
     "name"=>"MOBIL coleta de eletrônicos na UNB",
     "creator"=>467520383271680,
     "privacy"=>"OPEN",
     "pic_small"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/276736_113777585438869_900678253_t.jpg",
    "pic_big"=>
  "http://profile.ak.fbcdn.net/hprofile-ak-ash4/276736_113777585438869_900678253_n.jpg",
    "location"=>"Minhocão - Unb",
    "venue"=>{"id"=>186566614767362},
    "start_time"=>"2012-09-13T19:00:00-0300",
    "end_time"=>"2012-09-14T02:00:00-0300"}]
end

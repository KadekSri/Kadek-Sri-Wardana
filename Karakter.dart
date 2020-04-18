class Karakter {
final String avatar;
  final String title;
  final String description;
  final intcolor;

Karakter({
this.avatar,
this.title,
this.description,
this.color,
});
}

final karakters = <Karakter>[
Karakter(
    title: "BOLA BASKET",
description:
"Bola basket (bahasaInggris: basketball) adalaholahraga bola berkelompok yang terdiriatasduatimberanggotakanmasing-masing lima orang yang salingbertandingmencetakpoindenganmemasukkan bola kedalamkeranjanglawan. Bola basket sangatcocokuntukditontonkarenabiasadimainkan di ruangolahragatertutupdanhanyamemerlukanlapangan yang relatifkecil.",
avatar: "images/BASKET1.jpeg",
color: 0x00FFFF,
),
Karakter(
    title: "BOLA VOLI",
description:
"Bola voli (bahasaInggris: volleyball) adalahpermainanolahraga yang dimainkanolehduagrupberlawanan. Masing-masinggrupmemilikienam orang pemain. Terdapat pula variasipermainan bola volipantai yang masing-masinggruphanyamemilikidua orang pemain. Olahraga Bola Volidinaungi FIVB (Federation Internationale de Volleyball)[1] sebagaiindukorganisasiinternasional, sedangkan di Indonesia, olahraga bola Volidinaungioleh PBVSI (Persatuan Bola VoliSeluruh Indonesia).",
avatar: "images/VOLI1.jpeg",
color: 0xFFFF00,
),
Karakter(
    title: "SEPAK BOLA",
description:
"Sepak bola (bahasaInggris: Football atau Soccer) adalahcabangolahraga yang menggunakan bola yang umumnyaterbuatdaribahankulitdandimainkanolehduatim yang masing-masingberanggotakan 11 (sebelas) orang pemain inti danbeberapapemaincadangan.Memasukiabad ke-21, olahragainitelahdimainkanolehlebihdari 250 juta orang di 200 negara, yang menjadikannyaolahraga paling populer di dunia.",
avatar: "images/BOLA.jpeg",
color: 0x000000,
),
];

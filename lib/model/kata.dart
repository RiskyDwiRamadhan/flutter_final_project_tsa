class Kata {
  int? id;
  String? gambar;
  String? bindo;
  String? bing;
  String? kategori;

  Kata({this.id, this.gambar, this.bindo, this.bing, this.kategori});

  Kata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gambar = json['gambar'];
    bindo = json['bindo'];
    bing = json['bing'];
    kategori = json['kategori'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['gambar'] = this.gambar;
    data['bindo'] = this.bindo;
    data['bing'] = this.bing;
    data['kategori'] = this.kategori;
    return data;
  }
}

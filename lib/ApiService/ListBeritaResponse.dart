class ListBeritaResponse {
  List<Data> data;
  String message;
  int error;

  ListBeritaResponse({this.data, this.message, this.error});

  ListBeritaResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['error'] = this.error;
    return data;
  }
}

class Data {
  String id;
  String jdlNews;
  String namaKategori;
  String fotoNews;
  String judulSeo;
  String postOn;

  Data(
      {this.id,
        this.jdlNews,
        this.namaKategori,
        this.fotoNews,
        this.judulSeo,
        this.postOn});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jdlNews = json['jdl_news'];
    namaKategori = json['nama_kategori'];
    fotoNews = json['foto_news'];
    judulSeo = json['judul_seo'];
    postOn = json['post_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['jdl_news'] = this.jdlNews;
    data['nama_kategori'] = this.namaKategori;
    data['foto_news'] = this.fotoNews;
    data['judul_seo'] = this.judulSeo;
    data['post_on'] = this.postOn;
    return data;
  }
}
import 'package:get/get.dart';

class PrestasiController extends GetxController {
  final RxList<EkstrakurikulerModel> ekstrakurikulerList = <EkstrakurikulerModel>[].obs;
  final Rx<EkstrakurikulerModel?> selectedEkstrakurikuler = Rx<EkstrakurikulerModel?>(null);
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchEkstrakurikulerData();
  }

  void fetchEkstrakurikulerData() async {
    try {
      isLoading.value = true;

      await Future.delayed(Duration(seconds: 1)); // Simulasi loading

      ekstrakurikulerList.value = [
        EkstrakurikulerModel(
          id: 1,
          nama: "Futsal",
          deskripsi: "Ekstrakurikuler olahraga futsal untuk siswa yang memiliki minat dan bakat dalam permainan futsal.",
          logo: "assets/futsal-detail.png",
          prestasi: [
            PrestasiModel(
              id: 1,
              judul: "Juara 2 Liga Futsal Pelajar se-provinsi",
              tanggal: DateTime(2023, 11, 20),
              deskripsi: "Runner-up dalam kompetisi futsal pelajar tingkat SMP dalam kejuaraan DEMPO CUP.",
              gambar: "assets/futsal-detail.png",
            ),
          ],
        ),
        EkstrakurikulerModel(
          id: 2,
          nama: "Palang Merah Remaja",
          deskripsi: "Ekstrakurikuler Palang Merah Remaja mengajarkan siswa terkait medis.",
          logo: "assets/icons/choir.png",
          prestasi: [
          ],
        ),
        EkstrakurikulerModel(
          id: 3,
          nama: "Paskibra",
          deskripsi: "Tempat siswa belajar kedisiplinan dan baris-berbaris untuk upacara.",
          logo: "assets/detail-paski.png",
          prestasi: [
            PrestasiModel(
              id: 3,
              judul: "JUARA 2 MULA LPKBB JURAGAN 2 Malang",
              tanggal: DateTime(2024, 3, 15),
              deskripsi: "Juara 2 lomba baris-berbaris tingkat SMP se-Malang Raya.",
              gambar: "assets/paski-detail.png",
            ),
          ],
        ),
        EkstrakurikulerModel(
          id: 4,
          nama: "Dewan Galang",
          deskripsi: "Ekstrakurikuler Pramuka SMP yang beranggotakan para pemimpin regu",
          logo: "assets/icons/robotics.png",
          prestasi: [
            PrestasiModel(
              id: 4,
              judul: "Dempo Cup XVIII 2023",
              tanggal: DateTime(2023, 11, 20),
              deskripsi: "2 piala pada acara Dempo Cup XVIII 2023, dan mendapat juara sebagai Pinru terbaik pada tanggal 17 Oktober 2023",
              gambar: "assets/berita dempo cup 1 (1).png",
            )
          ], // ❌ Tidak memiliki prestasi
        ),
        EkstrakurikulerModel(
          id: 5,
          nama: "Basket",
          deskripsi: "Ekstrakurikuler tempat siswa belajar dan bermain bola Basket, dengan mengasah ketrampilan",
          logo: "assets/icons/english.png",
          prestasi: [], // ❌ Tidak memiliki prestasi
        ),
        EkstrakurikulerModel(
          id: 6,
          nama: "Voli",
          deskripsi: "Tempat belajar, bermain dan mengasah ketrampilan bermain voli",
          logo: "assets/icons/english.png",
          prestasi: [], // ❌ Tidak memiliki prestasi
        ),
        EkstrakurikulerModel(
          id: 7,
          nama: "Band",
          deskripsi: "Eksttrakurikuler sebagai sarana siswa belajar dan mengasah ketrampilan bermain musik",
          logo: "assets/icons/english.png",
          prestasi: [], // ❌ Tidak memiliki prestasi
        ),
        EkstrakurikulerModel(
          id: 8,
          nama: "Karate",
          deskripsi: "Ekstrakurikuler sebagai Tempat siswa melatih bela diri karate",
          logo: "assets/icons/english.png",
          prestasi: [
            PrestasiModel(
              id: 8,
              judul: "Kejuaraan Karate Festival & Open Tournament Piala Kemerdekaan RI- Ketua DPRD Kota Malang.",
              tanggal: DateTime(2023, 11, 20),
              deskripsi: "Muhammaad Aslam Kelas 9G berhasil mendapat juara 2 pada Kejuaraan Karate Festival & Open Tournament Piala Kemerdekaan RI- Ketua DPRD Kota Malang.",
              gambar: "assets/berita dempo cup 1 (2).png",
            )
          ], // ❌ Tidak memiliki prestasi
        ),
        EkstrakurikulerModel(
          id: 9,
          nama: "Al Banjari",
          deskripsi: "Ekstrakurikuler rohani islam dengan belajar memainkan alat musik dalam bersholawat",
          logo: "assets/icons/english.png",
          prestasi: [], // ❌ Tidak memiliki prestasi
        ),
        EkstrakurikulerModel(
          id: 10,
          nama: "Tari",
          deskripsi: "Ekstrakurikuler Sarana siswa untuk mengekspresikan diri melalui tarian",
          logo: "assets/icons/english.png",
          prestasi: [], // ❌ Tidak memiliki prestasi
        ),
      ];

      // Pilih otomatis ekstrakurikuler pertama
      if (ekstrakurikulerList.isNotEmpty) {
        selectedEkstrakurikuler.value = ekstrakurikulerList.first;
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void selectEkstrakurikuler(EkstrakurikulerModel ekskul) {
    selectedEkstrakurikuler.value = ekskul;
  }

  int getTotalPrestasi() {
    int total = 0;
    for (var ekskul in ekstrakurikulerList) {
      total += ekskul.prestasi.length;
    }
    return total;
  }

  EkstrakurikulerModel? getEkskulPrestasiTerbanyak() {
    if (ekstrakurikulerList.isEmpty) return null;

    EkstrakurikulerModel topEkskul = ekstrakurikulerList.first;
    for (var ekskul in ekstrakurikulerList) {
      if (ekskul.prestasi.length > topEkskul.prestasi.length) {
        topEkskul = ekskul;
      }
    }
    return topEkskul;
  }
}

// =====================
// Model Ekstrakurikuler
// =====================
class EkstrakurikulerModel {
  final int id;
  final String nama;
  final String deskripsi;
  final String logo;
  final List<PrestasiModel> prestasi;

  EkstrakurikulerModel({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.logo,
    required this.prestasi,
  });
}

// ==============
// Model Prestasi
// ==============
class PrestasiModel {
  final int id;
  final String judul;
  final DateTime tanggal;
  final String deskripsi;
  final String gambar;

  PrestasiModel({
    required this.id,
    required this.judul,
    required this.tanggal,
    required this.deskripsi,
    required this.gambar,
  });
}

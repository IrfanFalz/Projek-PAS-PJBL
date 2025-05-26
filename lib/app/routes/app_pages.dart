import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../modules/al-banjari/bindings/al_banjari_binding.dart';
import '../modules/al-banjari/views/al_banjari_view.dart';
import '../modules/band/bindings/band_binding.dart';
import '../modules/band/views/band_view.dart';
import '../modules/basket/bindings/basket_binding.dart';
import '../modules/basket/views/basket_view.dart';
import '../modules/dewan_galang/bindings/dewan_galang_binding.dart';
import '../modules/dewan_galang/views/dewan_galang_view.dart';
import '../modules/edit-profile/bindings/edit_profile_binding.dart';
import '../modules/edit-profile/views/edit_profile_view.dart';
import '../modules/futsal/bindings/futsal_binding.dart';
import '../modules/futsal/views/futsal_view.dart';
import '../modules/galeri/bindings/galeri_binding.dart';
import '../modules/galeri/views/galeri_view.dart';
import '../modules/help/bindings/help_binding.dart';
import '../modules/help/views/help_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jadwal/bindings/jadwal_binding.dart';
import '../modules/jadwal/views/jadwal_view.dart';
import '../modules/karate/bindings/karate_binding.dart';
import '../modules/karate/views/karate_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/palang-merah-remaja/bindings/palang_merah_remaja_binding.dart';
import '../modules/palang-merah-remaja/views/palang_merah_remaja_view.dart';
import '../modules/paskibra/bindings/paskibra_binding.dart';
import '../modules/paskibra/views/paskibra_view.dart';
import '../modules/pendaftaran/bindings/pendaftaran_binding.dart';
import '../modules/pendaftaran/views/pendaftaran_view.dart';
import '../modules/prestasi/bindings/prestasi_binding.dart';
import '../modules/prestasi/views/prestasi_view.dart';
import '../modules/profil/bindings/profil_binding.dart';
import '../modules/profil/views/profil_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/reset-password/bindings/reset_password_binding.dart';
import '../modules/reset-password/views/reset_password_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/tari/bindings/tari_binding.dart';
import '../modules/tari/views/tari_view.dart';
import '../modules/voli/bindings/voli_binding.dart';
import '../modules/voli/views/voli_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  // Custom transition for auth flow screens
  static final authTransition = Transition.rightToLeftWithFade;
  static final authDuration = Duration(milliseconds: 400);

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 800),
    ),
    GetPage(
      name: Routes.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 600),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
      transition: authTransition,
      transitionDuration: authDuration,
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: authTransition,
      transitionDuration: authDuration,
    ),
    GetPage(
      name: Routes.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
      transition: authTransition,
      transitionDuration: authDuration,
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.rightToLeft, // ✅ Ini yang akan digunakan
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: Routes.PRESTASI,
      page: () => PrestasiView(),
      binding: PrestasiBinding(),
      transition: Transition.rightToLeft, // ✅ Ini yang akan digunakan
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.GALERI,
      page: () => const GaleriView(),
      binding: GaleriBinding(),
      transition: Transition.rightToLeft, // ✅ Ini yang akan digunakan
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.PROFIL,
      page: () => const ProfilView(),
      binding: ProfilBinding(),
      transition: Transition.rightToLeft, // ✅ Ini yang akan digunakan
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.DEWAN_GALANG,
      page: () => const DewanGalangView(),
      binding: DewanGalangBinding(),
    ),
    GetPage(
      name: Routes.PASKIBRA,
      page: () => const PaskibraView(),
      binding: PaskibraBinding(),
    ),
    GetPage(
      name: Routes.FUTSAL,
      page: () => const FutsalView(),
      binding: FutsalBinding(),
    ),
    GetPage(
      name: Routes.BASKET,
      page: () => const BasketView(),
      binding: BasketBinding(),
    ),
    GetPage(
      name: Routes.VOLI,
      page: () => const VoliView(),
      binding: VoliBinding(),
    ),
    GetPage(
      name: Routes.PENDAFTARAN,
      page: () => const PendaftaranView(),
      binding: PendaftaranBinding(),
    ),
    GetPage(
      name: Routes.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: Routes.KARATE,
      page: () => const KarateView(),
      binding: KarateBinding(),
    ),
    GetPage(
      name: Routes.PALANG_MERAH_REMAJA,
      page: () => const PalangMerahRemajaView(),
      binding: PalangMerahRemajaBinding(),
    ),
    GetPage(
      name: Routes.AL_BANJARI,
      page: () => const AlBanjariView(),
      binding: AlBanjariBinding(),
    ),
    GetPage(
      name: Routes.TARI,
      page: () => const TariView(),
      binding: TariBinding(),
    ),
    GetPage(
      name: Routes.BAND,
      page: () => const BandView(),
      binding: BandBinding(),
    ),
    GetPage(
      name: Routes.JADWAL,
      page: () => JadwalView(),
      binding: JadwalBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.HELP,
      page: () => const HelpView(),
      binding: HelpBinding(),
    ),
  ];
}

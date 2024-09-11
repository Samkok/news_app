import 'package:demo/domain/article/controller/article_detail_controller.dart';
import 'package:demo/domain/auth/controller/auth_controller.dart';
import 'package:demo/domain/auth/controller/signin_controller.dart';
import 'package:demo/domain/auth/controller/signup_controller.dart';
import 'package:demo/domain/auth/pages/reset_password/reset_password.dart';
import 'package:demo/domain/auth/pages/signin/sign_in.dart';
import 'package:demo/domain/auth/pages/signup/sign_up.dart';
import 'package:demo/domain/article/controller/article_controller.dart';
import 'package:demo/domain/boarding/controller/boarding_controller.dart';
import 'package:demo/domain/channel/pages/channel_detail_page.dart';
import 'package:demo/domain/home/controller/home_controller.dart';
import 'package:demo/domain/profile/controller/profile_controller.dart';
import 'package:demo/domain/boarding/pages/boarding_page.dart';
import 'package:demo/domain/article/pages/create_update_article.dart';
import 'package:demo/domain/saves/pages/saved_page.dart';
import 'package:demo/domain/search/pages/search_page.dart';
import 'package:demo/domain/notification/pages/notification_page.dart';
import 'package:demo/domain/settings/controller/language_controller.dart';
import 'package:demo/domain/settings/controller/theme_controller.dart';
import 'package:demo/domain/settings/pages/about_us_page.dart';
import 'package:demo/domain/settings/pages/account_subpage/change_password_page.dart';
import 'package:demo/domain/settings/pages/account_subpage/email_page.dart';
import 'package:demo/domain/settings/pages/account_subpage/phone_number_page.dart';
import 'package:demo/domain/settings/pages/dark_light_mode_page.dart';
import 'package:demo/domain/settings/pages/language_page.dart';
import 'package:demo/domain/settings/pages/legal_policy_page.dart';
import 'package:demo/domain/settings/pages/notification_setting_page.dart';
import 'package:demo/domain/settings/pages/setting_page.dart';
import 'package:demo/domain/tags/pages/tag_page.dart';
import 'package:demo/firebase_options.dart';
import 'package:demo/utils/route_name.dart';
import 'package:demo/utils/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'domain/article/pages/detail_article_page.dart';
import 'domain/channel/pages/channel_page.dart';
import 'domain/onboarding/pages/onboarding.dart';
import 'domain/settings/controller/phone_number_controller.dart';
import 'domain/settings/pages/account_page.dart';
import 'domain/settings/pages/account_subpage/submit_email_page.dart';
import 'domain/settings/pages/privacy_page.dart';

// import 'package:news_app/utils/route_name.dart';
// import 'package:news_app/utils/themes.dart';
// import 'domain/article/controller/article_controller.dart';
// import 'domain/article/controller/article_detail_controller.dart';
// import 'domain/article/pages/create_update_article.dart';
// import 'domain/auth/controller/auth_controller.dart';
// import 'domain/auth/controller/signin_controller.dart';
// import 'domain/auth/controller/signup_controller.dart';
// import 'domain/auth/pages/reset_password/reset_password.dart';
// import 'domain/auth/pages/signin/sign_in.dart';
// import 'domain/auth/pages/signup/sign_up.dart';
// import 'domain/boarding/controller/boarding_controller.dart';
// import 'domain/boarding/pages/boarding_page.dart';
// import 'domain/channel/pages/channel_detail_page.dart';
// import 'domain/channel/pages/channel_page.dart';
// import 'domain/article/pages/detail_article_page.dart';
// import 'domain/home/controller/home_controller.dart';
// import 'domain/notification/pages/notification_page.dart';
// import 'domain/onboarding/pages/onboarding.dart';
// import 'domain/profile/controller/profile_controller.dart';
// import 'domain/saves/pages/saved_page.dart';
// import 'domain/search/pages/search_page.dart';
// import 'domain/settings/controller/language_controller.dart';
// import 'domain/settings/controller/phone_number_controller.dart';
// import 'domain/settings/controller/theme_controller.dart';
// import 'domain/settings/pages/about_us_page.dart';
// import 'domain/settings/pages/account_page.dart';
// import 'domain/settings/pages/account_subpage/change_password_page.dart';
// import 'domain/settings/pages/account_subpage/email_page.dart';
// import 'domain/settings/pages/account_subpage/phone_number_page.dart';
// import 'domain/settings/pages/account_subpage/submit_email_page.dart';
// import 'domain/settings/pages/dark_light_mode_page.dart';
// import 'domain/settings/pages/language_page.dart';
// import 'domain/settings/pages/legal_policy_page.dart';
// import 'domain/settings/pages/notification_setting_page.dart';
// import 'domain/settings/pages/privacy_page.dart';
// import 'domain/settings/pages/setting_page.dart';
// import 'domain/tags/pages/tag_page.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  Get.put(SignInController());
  Get.put(AuthController());
  Get.put(SignupController());
  Get.put(BoardingController());
  Get.put(HomeController());
  Get.put(ProfileController());
  Get.put(ArticleController());
  Get.put(PhoneNumberController());
  Get.put(LanguageController());
  Get.put(ThemeController());
  Get.put(ArticleDetailController());

  final ThemeController themeController = Get.put(ThemeController());
  await themeController.loadThemeMode(); // Load saved theme mode

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final themeController = Get.put(ThemeController());

    return GetBuilder<ThemeController>(
      builder: (context) {
        return GetMaterialApp(
          initialRoute: RouteName.onBoarding,
          getPages: [
            GetPage(
              name: RouteName.onBoarding,
              page: () => const Onboarding(),
            ),
            GetPage(
              name: RouteName.signIn,
              page: () => const SignInPage(),
              binding: BindingsBuilder(() {
                Get.lazyPut(() => SignInController());
              })
            ),
            GetPage(
              name: RouteName.signUp,
              page: () => const SignUpPage(),
              binding: BindingsBuilder(() {
                Get.lazyPut(() => SignInController());
              })
            ),
            GetPage(
              name: RouteName.resetPassword,
              page: () => const ResetPasswordPage(),
              binding: BindingsBuilder(() {
                Get.lazyPut(() => SignupController());
              })
            ),
            GetPage(
              name: RouteName.boarding,
              page: () => const BoardingPage(),
              binding: BindingsBuilder(() {
                Get.lazyPut(() => BoardingController());
                Get.lazyPut(() => AuthController());
                Get.lazyPut(() => HomeController());
                Get.lazyPut(() => ProfileController());
              })
            ),
            GetPage(
              name: RouteName.createUpdateArticle,
              page: () => const CreateUpdateArticlePage(),
              binding: BindingsBuilder(() {
                Get.lazyPut(() => BoardingController());
                Get.lazyPut(() => AuthController());
                Get.lazyPut(() => HomeController());
                Get.lazyPut(() => ProfileController());
              })
            ),
            GetPage(
              name: RouteName.setting,
              page: () => const SettingPage(),
              binding: BindingsBuilder(() {
                Get.lazyPut(() => AuthController());
              })
            ),
            GetPage(
              name: RouteName.account,
              page: () => const AccountPage(),
              binding: BindingsBuilder(() {
                Get.lazyPut(() => AuthController());
              })
            ),
            GetPage(
              name: RouteName.phoneNumber,
              page: () => const PhoneNumberPage(),
              binding: BindingsBuilder(() {
                Get.lazyPut(() => AuthController());
                Get.lazyPut(() => PhoneNumberController());
              })
            ),
            GetPage(
              name: RouteName.changeEmail,
              page: () => const ChangeEmailPage(),
              binding: BindingsBuilder(() {
                Get.lazyPut(() => AuthController());
              })
            ),
            GetPage(
              name: RouteName.submitEmail,
              page: () => const SubmitEmailPage(),
              binding: BindingsBuilder(() {
                Get.lazyPut(() => AuthController());
              })
            ),
            GetPage(
              name: RouteName.changePassword,
              page: () => const ChangePasswordPage(),
              binding: BindingsBuilder(() {
                Get.lazyPut(() => AuthController());
              })
            ),
            GetPage(
              name: RouteName.aboutUs,
              page: () => const AboutUsPage(),
              binding: BindingsBuilder(() {

              })
            ),
            GetPage(
              name: RouteName.legalAndPolicy,
              page: () => const LegalPolicyPage(),
              binding: BindingsBuilder(() {

              })
            ),
            GetPage(
              name: RouteName.privacy,
              page: () => const PrivacyPage(),
              binding: BindingsBuilder(() {

              })
            ),
            GetPage(
              name: RouteName.language,
              page: () => const LanguagePage(),
              binding: BindingsBuilder(() {
                Get.lazyPut(() => LanguageController());
              })
            ),
            GetPage(
                name: RouteName.notificationSetting,
                page: () => const NotificationSettingPage(),
                binding: BindingsBuilder(() {
                })
            ),
            GetPage(
                name: RouteName.darkMode,
                page: () => const DarkLightModePage(),
                binding: BindingsBuilder(() {
                  Get.lazyPut(() => ThemeController());
                })
            ),
            GetPage(
                name: RouteName.notification,
                page: () => const NotificationPage(),
                binding: BindingsBuilder(() {
                })
            ),
            GetPage(
                name: RouteName.saved,
                page: () => const SavedPage(),
                binding: BindingsBuilder(() {
                })
            ),
            GetPage(
                name: RouteName.search,
                page: () => const SearchPage(),
                binding: BindingsBuilder(() {
                })
            ),
            GetPage(
                name: RouteName.channel,
                page: () => const ChannelPage(),
                binding: BindingsBuilder(() {
                })
            ),
            GetPage(
                name: RouteName.channelDetail,
                page: () => const ChannelDetailPage(),
                binding: BindingsBuilder(() {
                })
            ),
            GetPage(
                name: RouteName.detailArticle,
                page: () => const DetailArticlePage(),
                binding: BindingsBuilder(() {
                  Get.lazyPut(() => ArticleDetailController());
                })
            ),
            GetPage(
                name: RouteName.tag,
                page: () => const TagPage(),
                binding: BindingsBuilder(() {
                })
            ),
          ],
          debugShowCheckedModeBanner: false,
          theme: Themes().lightTheme,
          darkTheme: Themes().darkTheme,
          themeMode: themeController.isDarkMode.value
              ? ThemeMode.dark
              : ThemeMode.light,
          home: const Scaffold(
            body: Onboarding(),
          ),
        );
      }
    );
  }
}



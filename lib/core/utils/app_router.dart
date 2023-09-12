
import 'package:go_router/go_router.dart';
import 'package:sneakers_store/cart/presentation/view/cart_screen.dart';
import 'package:sneakers_store/features/sneakers/home/view/home_page.dart';
import 'package:sneakers_store/features/sneakers/main/view/main_page.dart';
import 'package:sneakers_store/screens/Signup/signup_screen.dart';
import 'package:sneakers_store/screens/login/login_screen/login_screen.dart';
import 'package:sneakers_store/screens/login2/login_screen.dart';
import 'package:sneakers_store/screens/signup2/signup_screen.dart';
import 'package:sneakers_store/screens/splash/presentation/view/splash_screen.dart';
import 'package:sneakers_store/screens/welcome_screen/welcome_screen.dart';

abstract class AppRouter{
  static const KLoginView='/LoginView';
  static const KSignUpView='/SignUpView';
  static const KWelcomeView='/WelcomeView';
  static const KCartView="/CartView";
  static const KHomeView="/HomeView";

  static final router= GoRouter(

    routes: [

      GoRoute(
        path:'/',
        builder: (context, state) => const SplashScreenView(),
      ),

      GoRoute(
        path: KWelcomeView,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: KLoginView,
        builder: (context, state) =>  LoginScreen(),
      ),

      GoRoute(
        path: KCartView,
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path:KSignUpView,
        builder: (context, state) =>  SignupScreen(),
      ),
      GoRoute(
        path:KHomeView,
        builder: (context, state) => const MainPage(),
      ),
  ]
  );

}

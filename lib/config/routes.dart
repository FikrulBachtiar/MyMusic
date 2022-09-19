import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:my_music/view/home/v_beranda.dart';
import 'package:my_music/view/home/v_koleksi.dart';
import 'package:my_music/view/home/v_shorts.dart';
import 'package:my_music/view/home/v_subscription.dart';
import 'package:my_music/view/intro/v_profile.dart';
import 'package:my_music/view/koleksi/v_film_anda.dart';
import 'package:my_music/view/koleksi/v_histori.dart';
import 'package:my_music/view/koleksi/v_tonton_nanti.dart';
import 'package:my_music/view/v_home.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/profile',
      name: 'ProfileRoute',
      page: ProfileView,
    ),
    AutoRoute(
      path: '/',
      page: MyHomePage,
      children: [
        AutoRoute(
          path: 'beranda',
          name: 'BerandaRoute',
          page: BerandaView,
        ),
        AutoRoute(
          path: 'shorts',
          name: 'ShortsRoute',
          page: ShortsView,
        ),
        AutoRoute(
          path: 'subscription',
          name: 'SubscriptionRoute',
          page: SubscriptionView,
        ),
        AutoRoute(
          path: 'koleksi',
          name: 'KoleksiRoute',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: KoleksiView,
            ),
            AutoRoute(
              path: 'history',
              name: 'HistoryRoute',
              page: HistoriView,
            ),
            AutoRoute(
              path: 'tonton-nanti',
              name: 'TontonNantiRoute',
              page: TontonNantiView,
            ),
            AutoRoute(
              path: 'film-anda',
              name: 'FilmAndaRoute',
              page: FilmAndaView,
            ),
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}

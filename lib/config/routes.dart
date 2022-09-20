import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:my_music/config/transition.dart';
import 'package:my_music/view/beranda/v_play_video.dart';
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
    CustomRoute(
      path: '/profile',
      name: 'ProfileRoute',
      page: ProfileView,
    ),
    CustomRoute(
      path: '/',
      page: MyHomePage,
      children: [
        CustomRoute(
          path: 'beranda',
          name: 'BerandaRoute',
          page: EmptyRouterPage,
          children: [
            CustomRoute(
              path: '',
              page: BerandaView,
            ),
            CustomRoute(
              path: 'play-video',
              name: 'PlayVideoRoute',
              page: PlayVideoView,
              transitionsBuilder: zoomInTransition,
            ),
          ],
        ),
        CustomRoute(
          path: 'shorts',
          name: 'ShortsRoute',
          page: ShortsView,
        ),
        CustomRoute(
          path: 'subscription',
          name: 'SubscriptionRoute',
          page: SubscriptionView,
        ),
        CustomRoute(
          path: 'koleksi',
          name: 'KoleksiRoute',
          page: EmptyRouterPage,
          children: [
            CustomRoute(
              path: '',
              page: KoleksiView,
            ),
            CustomRoute(
              path: 'history',
              name: 'HistoryRoute',
              page: HistoriView,
            ),
            CustomRoute(
              path: 'tonton-nanti',
              name: 'TontonNantiRoute',
              page: TontonNantiView,
            ),
            CustomRoute(
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
class $CustomAppRouter {}

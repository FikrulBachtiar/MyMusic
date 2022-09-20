// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:auto_route/empty_router_widgets.dart' as _i3;
import 'package:flutter/material.dart' as _i13;

import '../view/beranda/v_play_video.dart' as _i7;
import '../view/home/v_beranda.dart' as _i6;
import '../view/home/v_koleksi.dart' as _i8;
import '../view/home/v_shorts.dart' as _i4;
import '../view/home/v_subscription.dart' as _i5;
import '../view/intro/v_profile.dart' as _i1;
import '../view/koleksi/v_film_anda.dart' as _i11;
import '../view/koleksi/v_histori.dart' as _i9;
import '../view/koleksi/v_tonton_nanti.dart' as _i10;
import '../view/v_home.dart' as _i2;
import 'transition.dart' as _i14;

class CustomAppRouter extends _i12.RootStackRouter {
  CustomAppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    ProfileRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.ProfileView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    MyHomeRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.MyHomePage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    BerandaRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ShortsRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.ShortsView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    SubscriptionRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.SubscriptionView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    KoleksiRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    BerandaView.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.BerandaView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    PlayVideoRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.PlayVideoView(),
        transitionsBuilder: _i14.zoomInTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    KoleksiView.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i8.KoleksiView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HistoryRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i9.HistoriView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    TontonNantiRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i10.TontonNantiView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    FilmAndaRoute.name: (routeData) {
      return _i12.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i11.FilmAndaView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
        ),
        _i12.RouteConfig(
          MyHomeRoute.name,
          path: '/',
          children: [
            _i12.RouteConfig(
              BerandaRoute.name,
              path: 'beranda',
              parent: MyHomeRoute.name,
              children: [
                _i12.RouteConfig(
                  BerandaView.name,
                  path: '',
                  parent: BerandaRoute.name,
                ),
                _i12.RouteConfig(
                  PlayVideoRoute.name,
                  path: 'play-video',
                  parent: BerandaRoute.name,
                ),
              ],
            ),
            _i12.RouteConfig(
              ShortsRoute.name,
              path: 'shorts',
              parent: MyHomeRoute.name,
            ),
            _i12.RouteConfig(
              SubscriptionRoute.name,
              path: 'subscription',
              parent: MyHomeRoute.name,
            ),
            _i12.RouteConfig(
              KoleksiRoute.name,
              path: 'koleksi',
              parent: MyHomeRoute.name,
              children: [
                _i12.RouteConfig(
                  KoleksiView.name,
                  path: '',
                  parent: KoleksiRoute.name,
                ),
                _i12.RouteConfig(
                  HistoryRoute.name,
                  path: 'history',
                  parent: KoleksiRoute.name,
                ),
                _i12.RouteConfig(
                  TontonNantiRoute.name,
                  path: 'tonton-nanti',
                  parent: KoleksiRoute.name,
                ),
                _i12.RouteConfig(
                  FilmAndaRoute.name,
                  path: 'film-anda',
                  parent: KoleksiRoute.name,
                ),
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.ProfileView]
class ProfileRoute extends _i12.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i2.MyHomePage]
class MyHomeRoute extends _i12.PageRouteInfo<void> {
  const MyHomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          MyHomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MyHomeRoute';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class BerandaRoute extends _i12.PageRouteInfo<void> {
  const BerandaRoute({List<_i12.PageRouteInfo>? children})
      : super(
          BerandaRoute.name,
          path: 'beranda',
          initialChildren: children,
        );

  static const String name = 'BerandaRoute';
}

/// generated route for
/// [_i4.ShortsView]
class ShortsRoute extends _i12.PageRouteInfo<void> {
  const ShortsRoute()
      : super(
          ShortsRoute.name,
          path: 'shorts',
        );

  static const String name = 'ShortsRoute';
}

/// generated route for
/// [_i5.SubscriptionView]
class SubscriptionRoute extends _i12.PageRouteInfo<void> {
  const SubscriptionRoute()
      : super(
          SubscriptionRoute.name,
          path: 'subscription',
        );

  static const String name = 'SubscriptionRoute';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class KoleksiRoute extends _i12.PageRouteInfo<void> {
  const KoleksiRoute({List<_i12.PageRouteInfo>? children})
      : super(
          KoleksiRoute.name,
          path: 'koleksi',
          initialChildren: children,
        );

  static const String name = 'KoleksiRoute';
}

/// generated route for
/// [_i6.BerandaView]
class BerandaView extends _i12.PageRouteInfo<void> {
  const BerandaView()
      : super(
          BerandaView.name,
          path: '',
        );

  static const String name = 'BerandaView';
}

/// generated route for
/// [_i7.PlayVideoView]
class PlayVideoRoute extends _i12.PageRouteInfo<void> {
  const PlayVideoRoute()
      : super(
          PlayVideoRoute.name,
          path: 'play-video',
        );

  static const String name = 'PlayVideoRoute';
}

/// generated route for
/// [_i8.KoleksiView]
class KoleksiView extends _i12.PageRouteInfo<void> {
  const KoleksiView()
      : super(
          KoleksiView.name,
          path: '',
        );

  static const String name = 'KoleksiView';
}

/// generated route for
/// [_i9.HistoriView]
class HistoryRoute extends _i12.PageRouteInfo<void> {
  const HistoryRoute()
      : super(
          HistoryRoute.name,
          path: 'history',
        );

  static const String name = 'HistoryRoute';
}

/// generated route for
/// [_i10.TontonNantiView]
class TontonNantiRoute extends _i12.PageRouteInfo<void> {
  const TontonNantiRoute()
      : super(
          TontonNantiRoute.name,
          path: 'tonton-nanti',
        );

  static const String name = 'TontonNantiRoute';
}

/// generated route for
/// [_i11.FilmAndaView]
class FilmAndaRoute extends _i12.PageRouteInfo<void> {
  const FilmAndaRoute()
      : super(
          FilmAndaRoute.name,
          path: 'film-anda',
        );

  static const String name = 'FilmAndaRoute';
}

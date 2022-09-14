import 'package:dio/dio.dart';
import 'package:my_music/config/env.dart';
import 'package:my_music/model/m_category_video.dart';
import 'package:my_music/model/m_video_list.dart';

class BerandaService {
  Dio dio = Dio();
  Future<VideoListModel> getVideoList({
    required int maxResults,
    String pageToken = '',
    String videoCategoryId = '0',
    String accessToken = '',
  }) async {
    try {
      Options? auth;
      if (accessToken != '') {
        auth = Options(headers: {"Authorization": "Bearer $accessToken"});
      }
      Response response = await dio.get(
        'https://youtube.googleapis.com/youtube/v3/videos?part=$partVideoListStatus&part=$partVideoListContentDetails&part=$partVideoListStatistics&part=$partVideoListSnippet',
        options: auth,
        queryParameters: {
          "key": apiKey,
          "chart": chartVideoList,
          "maxResults": maxResults,
          "pageToken": pageToken,
          "videoCategoryId": videoCategoryId,
        },
      );
      VideoListModel result = VideoListModel.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        VideoListModel message = VideoListModel.fromJson(e.response?.data);
        return message;
      } else {
        rethrow;
      }
    }
  }

  Future<CategoryVideoModel> getCategoryVideo({String accessToken = ''}) async {
    try {
      Options? auth;
      if (accessToken != '') {
        auth = Options(headers: {"Authorization": "Bearer $accessToken"});
      }
      Response response = await dio.get(
        'https://www.googleapis.com/youtube/v3/videoCategories?regionCode=$regionCodeCategoryVideo&part=$partCategoryVideoSnippet',
        options: auth,
        queryParameters: {
          "key": apiKey,
        },
      );
      CategoryVideoModel result = CategoryVideoModel.fromJson(response.data);
      return result;
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        CategoryVideoModel message =
            CategoryVideoModel.fromJson(e.response?.data);
        return message;
      } else {
        rethrow;
      }
    }
  }
}

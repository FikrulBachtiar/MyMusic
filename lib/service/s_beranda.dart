import 'package:dio/dio.dart';
import 'package:my_music/config/dio_configuration.dart';
import 'package:my_music/config/env.dart';
import 'package:my_music/model/m_category_video.dart';
import 'package:my_music/model/m_video_list.dart';

class BerandaService {
  Future<VideoListModel> getVideoList({
    required int maxResults,
    String pageToken = '',
    String videoCategoryId = '0',
  }) async {
    try {
      Response response = await dioWithToken.get(
        '/videos?part=$partVideoListStatus&part=$partVideoListContentDetails&part=$partVideoListStatistics&part=$partVideoListSnippet',
        queryParameters: {
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
        print("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
        print(e);
        print("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
        rethrow;
      }
    }
  }

  Future<CategoryVideoModel> getCategoryVideo({String accessToken = ''}) async {
    try {
      Response response = await dioWithToken.get(
        '/videoCategories?regionCode=$regionCodeCategoryVideo&part=$partCategoryVideoSnippet',
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

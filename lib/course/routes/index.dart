import 'package:fluro/fluro.dart';
import 'package:flutter_tianji/course/views/courseDetail.dart';
import 'package:flutter_tianji/course/views/myCourseListView.dart';
import 'package:flutter_tianji/routes/router_init.dart';

class CourseRouter implements IRouterProvider {
  static String myCourseList = '/myCourseList';
  static String courseDetails = '/courseDetail';

  @override
  void initRouter(FluroRouter router) {

    router.define(myCourseList, handler:
    Handler(handlerFunc: (context, Map<String, List<String>> params) {
      // Map<String, dynamic> item = json.decode(params['param'].first);
      // NoticeModel noticeModel = NoticeModel.fromJson(item);
      return myCourseListView();
    }));
    router.define(courseDetails, handler:
    Handler(handlerFunc: (context, Map<String, List<String>> params) {
      // Map<String, dynamic> item = json.decode(params['param'].first);
      // NoticeModel noticeModel = NoticeModel.fromJson(item);
      return courseDetail();
    }));
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_seekbar/seekbar/section_text_model.dart';
import 'package:flutter_tianji/baike/model/BannerNewModel.dart';
import 'package:flutter_tianji/baike/model/collectionListModel.dart';
import 'package:flutter_tianji/baike/model/projectDetailModel.dart';
import 'package:flutter_tianji/baike/model/screenTypeModel.dart';
import 'package:flutter_tianji/baike/server/index.dart';
import 'package:flutter_tianji/providers/view_state_model.dart';

class baikeProvider extends ViewStateModel {

  List<Cate> cateList=[];
  List<String> levelList=[];
  List<Map<String, dynamic>> list = [];
  List<SectionTextModel> sectionTextsGreen = [
    /* SectionTextModel(position: 0, text: 'C', progressColor: Color(0xffCBC4FF)),
    SectionTextModel(position: 1, text: 'C+', progressColor: Color(0xffCBC4FF)),
    SectionTextModel(position: 2, text: 'B', progressColor: Color(0xffCBC4FF)),
    SectionTextModel(position: 3, text: 'B+', progressColor: Color(0xffCBC4FF)),
    SectionTextModel(position: 4, text: 'A', progressColor: Color(0xffCBC4FF)),
    SectionTextModel(position: 5, text: 'A+', progressColor: Color(0xffCBC4FF)),*/
  ];
  List<collectionListModel> collectionList;
  projectDetailModel projectDetail;
  void getscreenType() async {
    list.clear();
    sectionTextsGreen.clear();
    setBusy();
    try {

      var res = await baikeServer.getscreenType();
      cateList = res.cate;
      levelList = res.level;
      for (int i = 0; i < levelList.length; i++) {
        sectionTextsGreen.add(SectionTextModel(position: i,
            text: '${levelList[i]}',
            progressColor: Color(0xffCBC4FF)));
      }
      for (int i = 0; i < cateList.length; i++) {
        Map<String, dynamic> map = {
          "id": cateList[i].id,
          "name": cateList[i].name,
        };
        list.add(map);
      }
      
      print("sectionTextsGreen:"+sectionTextsGreen.length.toString());
      print("list:"+list.length.toString());
      setIdle();
     notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }

    void getprojectDetail(id) async {
    setBusy();
    try {

      var res = await baikeServer.getprojectDetail(id);
      projectDetail= res;
      setIdle();
     notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }

  void getCollectionList() async {
    setBusy();
    try {

      var res = await baikeServer.getCollectionList();
      collectionList= res;
      setIdle();
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }
  void collect(id) async {
    setBusy();
    try {
      var res = await baikeServer.collect(id);

      setIdle();
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }

  List<BannerNewModel> banner;
  getBanner() async {
    setBusy();
    try {
      List<BannerNewModel> data = await baikeServer.getBanner();
      banner = data;
      setIdle();
      notifyListeners();
    } catch (e, s) {
      setError(e, s);
    }
  }
}
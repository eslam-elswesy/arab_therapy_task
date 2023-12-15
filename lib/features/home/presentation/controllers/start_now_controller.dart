import 'package:arab_therapy_task/core/consts/end_points_constants.dart';
import 'package:arab_therapy_task/core/services/http_client_service.dart';
import 'package:arab_therapy_task/models/api_response.dart';
import 'package:arab_therapy_task/models/image_model.dart';
import 'package:get/get.dart';



class StartNowController extends SuperController<dynamic> {
  StartNowController();

  RxBool waiting=false.obs;

  List<ImageModel> imagesList=[];


//TODO I didn't handle the pagination because it's not a part of the task
  Future _getStartNowData() async {
    waiting.value=true;
    change(true, status: RxStatus.success());


    try {
      ApiResponse response = await HttpClientService.sendRequest(
          endPoint: AppApiConstants.sampleData,
          requestType: HttpRequestTypes.get,
      );

      if (response.statusCode == 200 &&response.body!=null) {
        print("${AppApiConstants.sampleData}::oooo::${response.statusCode}::${response.successFlag}");
        if(response.body['photos']!=null){
          for(final item in response.body['photos']){
            imagesList.add(ImageModel.fromJson(item));
          }
        }

      } else {
        //TODO handle the else case // print only for show the result
        print("${AppApiConstants.sampleData}::oooo::else::${response.error})");
      }
    } catch (error) {
      //TODO handle the error case // print only for show the result
      print("${AppApiConstants.sampleData}::oooo::ERROR::${error.toString()})");
      // DialogWidget.confirmDialog(
      //     Get.context!,
      //     type: AppConstants.dialogTypes[1],
      //     agreeFunction: (bool){},
      //     title: StringsAssetsConstants.error,
      //     body: StringsAssetsConstants.server_error,
      //     isSingleBackButton: true
      // );
    } finally {
      waiting.value=false;
    }
    change(true, status: RxStatus.success());
  }

  @override
  void onInit() async {
    change(true, status: RxStatus.success());
    _getStartNowData();
    super.onInit();
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

}

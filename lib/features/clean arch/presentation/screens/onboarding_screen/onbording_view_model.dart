// import 'dart:async';

// import 'package:flutter_application_1/core/assets_manege.dart';
// import 'package:flutter_application_1/core/string_manege.dart';
// import 'package:flutter_application_1/features/clean%20arch/presentation/based_view/based_view_model.dart';
// import 'package:flutter_application_1/features/clean%20arch/presentation/screens/onboarding_screen/onboardin_models.dart';

// class OnbordingViewModel extends BasedVeiwModel
//     with OnBordingViewModelInput, OnBordingViewModelOutput {
//   @override
//   StreamController _streamController = StreamController<SliderViewObject>();
//   int currentindex = 0;
//   late List<Boarder> board;
//   void Dispose() {
//     _streamController.close();
//   }

//   @override
//   void Start() {
//     board = onboard();
//   }

//   @override
//   void goNext() {
//     // TODO: implement goNext
//   }

//   @override
//   void goPrevious() {
//     // TODO: implement goPrevious
//   }

//   @override
//   void onPageChange(int index) {
//     currentindex = index;
//     PostDataToView();
//   }

//   @override
//   // TODO: implement inputSliderViewObject
//   Sink get inputSliderViewObject => _streamController.sink;

//   @override
//   // TODO: implement outputSliderViewObject
//   Stream<SliderViewObject> get outputSliderViewObject =>
//       _streamController.stream.map((SliderViewObject) => SliderViewObject);
//   void PostDataToView() {
//     inputSliderViewObject
//         .add(SliderViewObject(board[currentindex], currentindex, board.length));
//   }

//   List<Boarder> onboard() => [
//         Boarder(
//             body: AppString.onBordingTitile1,
//             title: AppString.onBordingSubTitile1,
//             image: ImageAssets.onbordinglogo),
//         Boarder(
//             body: AppString.onBordingTitile1,
//             title: AppString.onBordingSubTitile1,
//             image: ImageAssets.onbordinglogo),
//         Boarder(
//             body: AppString.onBordingTitile1,
//             title: AppString.onBordingSubTitile1,
//             image: ImageAssets.onbordinglogo)
//       ];
// }

// abstract class OnBordingViewModelInput {
//   void goNext();
//   void goPrevious();
//   void onPageChange(int index);

//   Sink get inputSliderViewObject;
// }

// abstract class OnBordingViewModelOutput {
//   Stream<SliderViewObject> get outputSliderViewObject;
// }

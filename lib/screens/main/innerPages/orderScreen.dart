import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:nimble_simple/screens/main/innerPages/widgets/custom_clipper.dart';

import '../../../core/datasource/local_storage.dart';
import '../../../core/navigation/keys.dart';
import '../../../core/navigation/navigation_service.dart';
import '../../../core/startup/app_startup.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/images.dart';
import '../../../core/utils/response_message.dart';
import '../../../core/widgets/button.dart';
import '../cubit/main_cubit.dart';
import '../model/DrugList.dart';
import '../model/PharmacyDetails.dart';
import '../model/PurchaseList.dart';

class OrderScreen extends StatefulWidget {
  PharmacyDetails? pharmacyDetails;
  OrderScreen({Key? key, this.pharmacyDetails}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  PharmacyDetails? _pharmacyDetails;
  List<List<dynamic>>? rowsAsListOfValues;
  List<dynamic>? _selectedDrugs = [];
  List<dynamic>? _selectedDrugs2 = [];
  DrugList? _drugList;
  @override
  void initState() {
    _getData();
    super.initState();
  }

  Future<void> _getData() async {
    rowsAsListOfValues = await serviceLocator<MainCubit>().getDrugList();
    _drugList = DrugList.fromList(rowsAsListOfValues);
    print("::::::----"+rowsAsListOfValues![0].toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    // For Grid Layout
    double _crossAxisSpacing = 8, _mainAxisSpacing = 8, _cellHeight = 150.0;
    int _crossAxisCount = 2;

    double _width = (MediaQuery.of(context).size.width -
        ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    double _aspectRatio =
        _width / (_cellHeight + _mainAxisSpacing + (_crossAxisCount + 1));

    return Scaffold(
        backgroundColor: AppColors.sonaWhite,
        body: BlocListener(
          bloc: serviceLocator.get<MainCubit>(),
          listener: (_, state) {
            if (state is DrugListLoading) {
              context.loaderOverlay.show();
            }

            if (state is DrugListError) {
              context.loaderOverlay.hide();
              ResponseMessage.showErrorSnack(
                  context: context, message: state.message);
            }

            if (state is DrugListSuccess) {
              context.loaderOverlay.hide();
              setState(() {});
            }
          },
          child: rowsAsListOfValues == null
              ? Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: 80.0,
                  width: 80.0,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  height: 120.0,
                  width: 120.0,
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(
                    AppAssets.rxLoader,
                    height: 50.0,
                    width: 50.0,
                  ),
                )
              ],
            ),
          )
              : Stack(
            children: <Widget>[
              ClipPath(
                clipper: MyCustomClipper(clipType: ClipType.bottom),
                child: Container(
                  color: AppColors.sonaBlack,
                  height: AppConstants.headerHeight + statusBarHeight,
                ),
              ),

              Positioned(
                right: -45,
                top: -30,
                child: ClipOval(
                  child: Container(
                    color: Colors.black.withOpacity(0.05),
                    height: 220,
                    width: 220,
                  ),
                ),
              ),

              // BODY
              Padding(
                padding: EdgeInsets.all(AppConstants.paddingSide),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            // Back Button
                            SizedBox(
                              width: 34,
                              child: RawMaterialButton(
                                materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                                onPressed: () {
                                  serviceLocator.get<NavigationService>().pop();
                                },
                                child: Icon(Icons.arrow_back_ios,
                                    size: 25.0, color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Order Now",
                              style: TextStyle(
                                  fontSize: 24, color: Colors.white),
                            ),
                          ],
                        ),
                        Spacer(),
                        Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/icons/heartbeatthin.png'),
                            height: 73,
                            width: 80,
                            color: Colors.white.withOpacity(1)),
                      ],
                    ),
                    SizedBox(height: 30),
                    // Chart
                    Material(
                      shadowColor: Colors.grey.withOpacity(0.01), // added
                      type: MaterialType.card,
                      elevation: 10,
                      borderRadius: new BorderRadius.circular(10.0),
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: AppButton(
                                    buttonText: "Select Drugs".tr(),
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                          isScrollControlled: true, // required for min/max child size
                                          context: context,
                                          builder: (ctx) {
                                            //create an array and convert it to MultiSelectItem compatible
                                            List<MultiSelectItem<List<dynamic>>>? _items = [];
                                            for(int i=0; i < rowsAsListOfValues!.length; i++) {
                                              _items.add(MultiSelectItem<List<dynamic>>(rowsAsListOfValues![i], rowsAsListOfValues![i][0].toString()));
                                            }
                                            return  MultiSelectBottomSheet(
                                          items: _items,
                                          initialValue: _selectedDrugs!,
                                          initialChildSize: 0.7,
                                          maxChildSize: 0.95,
                                          title: Text(
                                              "Available List of Drugs",
                                            style: TextStyle(fontSize: 14.sp),
                                          ),
                                          searchable: true,
                                          onSelectionChanged: (values) {
                                            _selectedDrugs = values;
                                            setState(() {});
                                            print(_selectedDrugs);
                                          },
                                        );
                                      },
                                      );
                                    })),
                                    SizedBox(height: 50),
                            _selectedDrugs!.length != 0
                            ? Text("Selected Drugs".tr(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700))
                            : SizedBox.shrink(),
                            SizedBox(height: 20),
                                for(dynamic item in _selectedDrugs!)
                                    Text(item![0],
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                        fontSize: 16, color: AppColors.sonaBlack3, fontWeight: FontWeight.w700)),

                            SizedBox(height: 50),
                            _selectedDrugs!.length != 0
                                ? SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: AppButton(
                                    buttonText: "Buy selected drugs".tr(),
                                    onPressed: () async {
                                      //process buying
                                      var myObject = {
                                        "pharmacy_name": widget.pharmacyDetails!.value!.name!,
                                        "pharmacy_id": widget.pharmacyDetails!.value!.id!,
                                        "drugs": _selectedDrugs,
                                      };
                                      PurchaseList _purchaseList = PurchaseList.fromJson(myObject);
                                      //store
                                      GetIt.I.get<LocalStorage>().writeSecureObject(key: widget.pharmacyDetails!.value!.id!, value: _purchaseList);

                                      /// goto home screen
                                      serviceLocator.get<NavigationService>().pop();
                                      serviceLocator.get<NavigationService>().replaceWith(RouteKeys.routeBottomNavi);
                                      //show success msg
                                      ResponseMessage.showSuccessSnack(
                                          context: context, message: "Product successfully bought".tr());
                                    }))
                                : SizedBox.shrink(),
                          ],
                        ),
                      ), // added
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

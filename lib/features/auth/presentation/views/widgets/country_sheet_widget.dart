import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:arab_therapy_task/core/consts/container_style.dart';
import 'package:arab_therapy_task/core/consts/icons_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/strings_assets_constants.dart';
import 'package:arab_therapy_task/core/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:arab_therapy_task/core/widgets/text_field_widget.dart';
import 'package:arab_therapy_task/models/country_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


List<CountryModel> countryList=[
  CountryModel(enName: "KSA",arName: "السعودية",phoneCode: "+966",image: IconsAssetsConstants.saFlag),
  CountryModel(enName: "Egypt",arName: "مصر",phoneCode: "+20",image: IconsAssetsConstants.egyptFlag),
  CountryModel(enName: "Kuwait",arName: "الكويت",phoneCode: "+967",image: IconsAssetsConstants.kuwiatFlag),
  CountryModel(enName: "Oman",arName: "الكويت",phoneCode: "+967",image: IconsAssetsConstants.kuwiatFlag),
  CountryModel(enName: "KSA",arName: "السعودية",phoneCode: "+966",image: IconsAssetsConstants.saFlag),
  CountryModel(enName: "Egypt",arName: "مصر",phoneCode: "+20",image: IconsAssetsConstants.egyptFlag),
  CountryModel(enName: "Kuwait",arName: "الكويت",phoneCode: "+967",image: IconsAssetsConstants.kuwiatFlag),
  CountryModel(enName: "Oman",arName: "الكويت",phoneCode: "+967",image: IconsAssetsConstants.kuwiatFlag),
  CountryModel(enName: "KSA",arName: "السعودية",phoneCode: "+966",image: IconsAssetsConstants.saFlag),
  CountryModel(enName: "Egypt",arName: "مصر",phoneCode: "+20",image: IconsAssetsConstants.egyptFlag),
  CountryModel(enName: "Kuwait",arName: "الكويت",phoneCode: "+967",image: IconsAssetsConstants.kuwiatFlag),
  CountryModel(enName: "Oman",arName: "الكويت",phoneCode: "+967",image: IconsAssetsConstants.kuwiatFlag),
];


TextEditingController searchController= TextEditingController();

void OpenCountryBottomSheet(BuildContext context,{required Function(CountryModel) selectFunction}) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
      ),
      builder: (context) {
        List<CountryModel>  countryListAfterFilter=[];
        String search =searchController.text.toLowerCase();
        if(search==""){
          countryListAfterFilter.addAll(countryList);
        }else{
        for(final country in countryList){
          if(country.arName.toLowerCase().contains(search)||country.enName.toLowerCase().contains(search)||country.phoneCode.contains(search)){
            countryListAfterFilter.add(country);
          }
        }
        }
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      StringsAssetsConstants.chooseyourcountry,
                      style: AppTextStyle.black_15BOLD,
                    ),
                  ),
                  TextFieldWidget(
                    filled: false,
                    label:  StringsAssetsConstants.email,
                    hint: StringsAssetsConstants.searchofcountry,
                    controller: searchController,
                    error: null,
                    isLabelOutside:false,
                    suffixIcon:const Icon(Icons.search,color: AppColors.primaryColor,size: 25,),
                    onChange: (x){
                      setState(() {
                      });
                    },
                  ),
                  Container(
                    height: 0.3.sh,
                    child:countryListAfterFilter.isEmpty?
                    Center(
                      child: Text("لا يوجد دوله بهذا الاسم او الرمز",
                      style: AppTextStyle.black_13,),
                    ):
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      itemBuilder: (cx,index)=>Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            selectFunction(countryList[index]);
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 0.9.sw,
                            decoration: AppContainerStyle.radiusAll15Shadow,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                              child: Row(
                                children: [
                                  Image.asset(countryListAfterFilter[index].image,height: 30.h,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Column(
                                      children: [
                                        Text(countryListAfterFilter[index].arName,
                                          style: AppTextStyle.black_14BOLD,),
                                        Text(countryListAfterFilter[index].phoneCode,
                                          style: AppTextStyle.grey_13,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      itemCount: countryListAfterFilter.length,),
                  )
                ],
              ),
            );
          },
        );
      });
}





import 'package:arab_therapy_task/core/consts/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AppContainerStyle{

  static BoxDecoration circel =  BoxDecoration(
    shape: BoxShape.circle,
  );

  static BoxDecoration circelGradient =  BoxDecoration(
    color: Colors.white ,
    shape: BoxShape.circle,
    gradient: LinearGradient(colors: [
      AppColors.primaryColor,
      AppColors.secondaryColor,
    ],
        end: Alignment.topRight, begin: Alignment.bottomLeft, tileMode: TileMode.clamp),
  );

  static BoxDecoration circelShadow =  BoxDecoration(
    color: Colors.white ,
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(color: AppColors.black.withOpacity(0.1),
          offset: Offset(5,2),
          spreadRadius: 1,
          blurRadius: 10
      ),
      BoxShadow(color: AppColors.black.withOpacity(0.1),offset: Offset(-3,-4),spreadRadius: -2,blurRadius: 20
      )
    ],
  );

   static BoxDecoration radiusAll40Shadow =  BoxDecoration(
      color: Colors.white ,
      boxShadow: [
        BoxShadow(color: AppColors.black.withOpacity(0.1),
            offset: Offset(5,2),
            spreadRadius: 1,
            blurRadius: 10
        ),
        BoxShadow(color: AppColors.black.withOpacity(0.1),offset: Offset(-3,-4),spreadRadius: -2,blurRadius: 20
        )
      ],
      borderRadius: BorderRadius.circular(40)
  );

  static BoxDecoration radiusAll40 =  BoxDecoration(
      borderRadius: BorderRadius.circular(40)
  );

  static BoxDecoration radiusAll15Shadow =  BoxDecoration(
      color: Colors.white ,
      boxShadow: [
        BoxShadow(color: AppColors.gray500.withOpacity(0.1),
            offset: Offset(5,2),
            spreadRadius: 1,
            blurRadius: 10
        ),
        BoxShadow(color: AppColors.gray500.withOpacity(0.1),offset: Offset(-3,-4),spreadRadius: -2,blurRadius: 20
        )
      ],
      borderRadius: BorderRadius.circular(15)
  );

  static BoxDecoration radiusAll15 =  BoxDecoration(
      color: Colors.white ,
      borderRadius: BorderRadius.circular(15)
  );
  static BoxDecoration radiusTop15 =  BoxDecoration(
      color: Colors.white ,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      )
  );
  static BoxDecoration radiusBottom15 =  BoxDecoration(
      color: Colors.white ,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      )
  );
  static BoxDecoration radiusAll120 =  BoxDecoration(
      color: Colors.white ,
      borderRadius: BorderRadius.circular(120)
  );

  static BoxDecoration radiusAll8Shadow =  BoxDecoration(
      color: Colors.white ,
      boxShadow: [
        BoxShadow(color: AppColors.gray500.withOpacity(0.1),
            offset: Offset(5,2),
            spreadRadius: 1,
            blurRadius: 10
        ),
        BoxShadow(color: AppColors.gray500.withOpacity(0.1),offset: Offset(-3,-4),spreadRadius: -2,blurRadius: 20
        )
      ],
      borderRadius: BorderRadius.circular(8)
  );
  static BoxDecoration radiusAll4 =  BoxDecoration(
      color: Colors.white ,
      borderRadius: BorderRadius.circular(4)
  );

  static BoxDecoration radiusAllBorder =  BoxDecoration(
      color: Colors.white ,
      borderRadius: BorderRadius.circular(0),

    border: Border.all(
      color: AppColors.gray500,
      width: 0.3
    )
  );
  static BoxDecoration radiusLeftRightBorderOnly =  BoxDecoration(
      color: Colors.white ,

    border: Border(
        left: BorderSide( color: AppColors.gray300,
            width: 0.3),
      right: BorderSide( color: AppColors.gray300,
          width: 0.3)
    )
  );
  static BoxDecoration radiusAllRadiusZero =  BoxDecoration(
      color: Colors.white ,
      borderRadius: BorderRadius.circular(0),
  );

  static BoxDecoration radiusAll8 =  BoxDecoration(
      color: Colors.white ,
      borderRadius: BorderRadius.circular(8)
  );

  static BoxDecoration radiusAll8Gradient =  BoxDecoration(
    color: Colors.white ,
    borderRadius: BorderRadius.circular(8),
    gradient: LinearGradient(colors: [
      AppColors.primaryColor,
      AppColors.secondaryColor,
    ],
        end: Alignment.topRight, begin: Alignment.bottomLeft, tileMode: TileMode.clamp),
  );
}



const BoxDecoration ContainerRadius10Top =  BoxDecoration(
    color: Colors.white ,
    borderRadius: BorderRadius.only(topRight: Radius.circular(10) , topLeft: Radius.circular(10))
);

const BoxDecoration Container_radiusOnly10Down =  BoxDecoration(
    color: Colors.white ,
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10) , bottomRight: Radius.circular(10))
);


BoxDecoration Container_radiusOnly10Left =  BoxDecoration(
    color: Colors.white ,
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10) , topLeft: Radius.circular(10))
);

BoxDecoration Container_radiusOnly10Right =  BoxDecoration(
    color: Colors.white ,
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(10) , topRight: Radius.circular(10))
);

BoxDecoration Container_radiusOnly15leftTop =  BoxDecoration(
    color: Colors.white ,
    borderRadius: "lang".tr=="ar"?BorderRadius.only( topRight: Radius.circular(15)):BorderRadius.only( topLeft: Radius.circular(15))
);



 BoxDecoration ContainerRadiusAll10 =  BoxDecoration(
    color: Colors.white ,
    borderRadius: BorderRadius.circular(10),
);

 BoxDecoration ContainerRadiusAll15NoShadow =  BoxDecoration(
    color: Colors.white ,
    borderRadius: BorderRadius.circular(15),
);


BoxDecoration ContainerRadiusAll180NoShadow =  BoxDecoration(
  color: Colors.white ,
  borderRadius: BorderRadius.circular(180),
);



BoxDecoration ContainerRadiusAll15 =  BoxDecoration(
  borderRadius: BorderRadius.circular(15.0),
  boxShadow: [
    BoxShadow(
        color: AppColors.gray600.withOpacity(0.2),
        offset: Offset(1,1),
        spreadRadius: 1,
        blurRadius: 10
    ),
  ],
  color: AppColors.white,
);

BoxDecoration ContainerRadiusAll5 =  BoxDecoration(
  borderRadius: BorderRadius.circular(5.0),
  boxShadow: [
    BoxShadow(
        color: AppColors.gray600.withOpacity(0.2),
        offset: Offset(1,1),
        spreadRadius: 1,
        blurRadius: 10
    ),
  ],
  color: AppColors.white,
);


BorderRadius getBorderByLang(double borderRadius,String side)
{
  Radius topLeft=Radius.circular(0);
  Radius bottomLeft=Radius.circular(0);
  Radius topRight=Radius.circular(0);
  Radius bottomRight=Radius.circular(0);

  //side can be up,down,right,left,all
  if(side=="all")
    {
       topLeft=Radius.circular(borderRadius);
       bottomLeft=Radius.circular(borderRadius);
       topRight=Radius.circular(borderRadius);
       bottomRight=Radius.circular(borderRadius);
    }
  else if(side=="left")
    {
      if("lang".tr=="ar")//arabic
        {
        topRight=Radius.circular(borderRadius);
        bottomRight=Radius.circular(borderRadius);
      }
      else
        {
          topLeft=Radius.circular(borderRadius);
          bottomLeft=Radius.circular(borderRadius);
        }
    }
  else if(side=="right")
    {
      if("lang".tr=="ar")//arabic
        {
        topLeft=Radius.circular(borderRadius);
        bottomLeft=Radius.circular(borderRadius);

      }
      else
        {
          topRight=Radius.circular(borderRadius);
          bottomRight=Radius.circular(borderRadius);
        }
    }


  return BorderRadius.only(bottomLeft:  bottomLeft, topLeft: topLeft,bottomRight: bottomRight,topRight: topRight);
}


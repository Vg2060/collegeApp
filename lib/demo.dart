import 'package:google_maps_flutter/google_maps_flutter.dart';

class College {
  String place;
  String thumbNail;
  LatLng locationCoords;

  College(
      {this.place,
        this.thumbNail,
        this.locationCoords});
}

final List<College> spot = [
  College(
      place: 'ENTRANCE',
      locationCoords: LatLng(10.93907625, 76.95194721),
      thumbNail: 'https://www.google.com/maps/uv?pb=!1s0x3ba85bb22369d571%3A0x72cc0bed93b5b2b6!3m1!7e115!4shttps%3A%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipPK_YoD8iSJ0IIkUWmBaFBd5IMeSF827N25OH4G%3Dw213-h160-k-no!5sskcet%20-%20Google%20Search!15sCgIgAQ&imagekey=!1e10!2sAF1QipPK_YoD8iSJ0IIkUWmBaFBd5IMeSF827N25OH4G&hl=en&sa=X&ved=2ahUKEwj0r-GhwZDsAhVWeH0KHcbjCwgQoiowDnoECBkQBQ&cshid=1601456238000349'
  ),
  College(
      place: 'KRISHNA TEMPLE',
      locationCoords: LatLng(10.93836696, 76.95268035),
      thumbNail: 'https://www.google.com/search?q=skcet+krishna+temple+images&rlz=1C1CHBF_enIN861IN861&sxsrf=ALeKk0242RUbSevv6s8ZoJse8vWLw3fR7A:1601462071642&tbm=isch&source=iu&ictx=1&fir=zptMyIeCoLOkYM%252CFkitGi3vsBEnrM%252C_&vet=1&usg=AI4_-kRRnIPslTvDX4YxQYe43aI9FS6neg&sa=X&ved=2ahUKEwiq2JqP15DsAhWTguYKHc_XDTgQ9QF6BAgKEAg#imgrc=zptMyIeCoLOkYM'
  ),
  College(
      place: 'ADMIN BLOCK',
      locationCoords: LatLng(10.93768226, 76.95639253),
      thumbNail: 'https://www.google.com/maps/uv?pb=!1s0x3ba85bb1b0ab8231:0xc757883437577ff7!3m1!7e115!4shttps://lh5.googleusercontent.com/p/AF1QipMvSMrc0vS13rs_f40L4GR5krDmfea0XSf-FWzv%3Dw260-h160-k-no!5sskcet+admin+block+-+Google+Search!15zQ2dJZ0FRPT0&imagekey=!1e10!2sAF1QipMvSMrc0vS13rs_f40L4GR5krDmfea0XSf-FWzv&hl=en&sa=X&ved=2ahUKEwiqhaqf1pDsAhUR63MBHemwAY8QoiowFHoECBUQBg'
  ),
  College(
      place: 'LIBRARY',
      locationCoords: LatLng(10.93855306, 76.95605457),
      thumbNail: 'https://www.google.com/maps/uv?pb=!1s0x3ba85bb1aa2482db:0xbc4461c5c30167bd!3m1!7e115!4shttps://lh5.googleusercontent.com/p/AF1QipPlf_MPp1SF3-GzAMAXcgMVbcTfBhHm7_13SxrM%3Dw213-h160-k-no!5sskcet+library+-+Google+Search!15zQ2dJZ0FRPT0&imagekey=!1e10!2sAF1QipPlf_MPp1SF3-GzAMAXcgMVbcTfBhHm7_13SxrM&hl=en&sa=X&ved=2ahUKEwjk_e7N1pDsAhW0guYKHf0PAQAQoiowC3oECBcQBg'
  ),

  College(
      place: 'KRISHNA HALL',
      locationCoords: LatLng(10.93929395, 76.95890844),
      thumbNail: 'https://www.google.com/search?q=krishna+hall+skcet+images&rlz=1C1CHBF_enIN861IN861&sxsrf=ALeKk03DTeE8Qm_UmLiCDX4fTKKtDPORoA:1601469026191&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjiwrKD8ZDsAhW1zDgGHbOZDdkQ_AUoAXoECBcQAw&biw=1366&bih=625#imgrc=9_Fxx-DVXzg42M'
  ),
  College(
      place: 'JMR CAFE',
      locationCoords: LatLng(10.93875847, 76.95665717),
      thumbNail: 'https://www.google.com/search?q=food+court+skcet+images&rlz=1C1CHBF_enIN861IN861&sxsrf=ALeKk01eIXpkuTZxdMn2XwCTfJDFNoCzfg:1601462233565&tbm=isch&source=iu&ictx=1&fir=C63CPevu-tLZrM%252CRxVk3o9dDk6j2M%252C_&vet=1&usg=AI4_-kQ1mQtmVDUAnveZn1ypwhSqV7g3Ow&sa=X&ved=2ahUKEwiwyrXc15DsAhVo73MBHQ5SA0UQ9QF6BAgKECA#imgrc=C63CPevu-tLZrM'
  ),
  College(
      place: 'HOR-MEN',
      locationCoords: LatLng(10.9396521, 76.96112394),
      thumbNail: 'https://www.google.com/maps/uv?pb=!1s0x3ba85bb3bad1a2b1%3A0x423a28dc8d6b5fe5!3m1!7e115!4shttps%3A%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipP9AH685bUyNxuzj9vSdCBT44tiwkTSBqBk2CPr%3Dw213-h160-k-no!5sskcet%20hall%20of%20residence%20men%20-%20Google%20Search!15sCgIgAQ&imagekey=!1e10!2sAF1QipP9AH685bUyNxuzj9vSdCBT44tiwkTSBqBk2CPr&hl=en&sa=X&ved=2ahUKEwiU5v72yZDsAhXlxTgGHWyVAXQQoiowC3oECBgQBg'
  ),
  College(
      place: 'HOR-WOMEN',
      locationCoords: LatLng(10.93444832, 76.95329726),
      thumbNail: 'https://www.google.com/search?q=skcet+girls+hostel+images&rlz=1C1CHBF_enIN861IN861&sxsrf=ALeKk02GVp5cJTU8xsriqMwAE0HyQLFZqg:1601462138048&tbm=isch&source=iu&ictx=1&fir=ZkPtWPWyHH5j1M%252CeIhmG9YXLu_naM%252C_&vet=1&usg=AI4_-kSDifrWAjxD6A5Y1PThQlv1SHvXfg&sa=X&ved=2ahUKEwj26--u15DsAhXR7HMBHfm9AOIQ9QF6BAgNEAY#imgrc=ZkPtWPWyHH5j1M'
  ),

];

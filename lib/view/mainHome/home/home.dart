// import 'package:abs_app/utils/constants/colors.dart';
// import 'package:abs_app/utils/helpers/helper_function.dart';
// import 'package:abs_app/views/home/detail_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../models/dummy_hosiptals.dart';

// class Home extends StatelessWidget {
//   const Home({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     return Scaffold(
//         backgroundColor: dark ? TColors.dark : TColors.light,
//         body: SafeArea(
//             child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 18.0),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: height * 00.02,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 5),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Search for Place',
//                     hoverColor: TColors.primary,
//                     prefixIcon: const Padding(
//                       padding: EdgeInsets.all(20.0),
//                       child: FaIcon(
//                         // ignore: deprecated_member_use
//                         FontAwesomeIcons.search,
//                       ),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: const BorderSide(
//                           color:
//                               TColors.primary), // Set the default border color
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       borderSide: const BorderSide(
//                           color: TColors
//                               .primary), // Set the border color when focused
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: height * 00.02,
//               ),
//               Container(
//                 height: height * 00.052,
//                 width: width * 00.845,
//                 decoration: BoxDecoration(
//                     color: TColors.grey,
//                     borderRadius: BorderRadius.circular(5)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Icon(
//                       FontAwesomeIcons.locationArrow,
//                       color: TColors.black,
//                     ),
//                     Text(
//                       "  Use my Current Location",
//                       style: GoogleFonts.lato(
//                         textStyle: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                             fontSize: 15 // Specify your desired color here
//                             ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: height * 00.03,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Available Ambulance",
//                     style: GoogleFonts.lato(
//                         textStyle: const TextStyle(
//                       fontWeight: FontWeight.w600,
//                     )),
//                   ),
//                   const Text("View All")
//                 ],
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: locations.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.all(25.0),
//                       child: Card(
//                         elevation: 5,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                         color: Colors.black,
//                         child: Column(
//                           children: [
//                             ClipRRect(
//                               borderRadius: const BorderRadius.only(
//                                 topRight: Radius.circular(15),
//                                 topLeft: Radius.circular(15),
//                               ),
//                               child: Image.asset(
//                                 locations[index].image,
//                                 height: 200, // Decreased height
//                                 fit: BoxFit.fill,
//                                 width: double.infinity,
//                               ),
//                             ),
//                             ListTile(
//                               contentPadding: const EdgeInsets.symmetric(
//                                   horizontal: 10,
//                                   vertical: 3), // Adjusted padding
//                               title: Text(
//                                 locations[index].name,
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               subtitle: Row(
//                                 children: [
//                                   Text(
//                                     locations[index].district,
//                                     style: const TextStyle(
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                   const Text(
//                                     ',',
//                                     style: TextStyle(
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 3,
//                                   ),
//                                   Text(
//                                     locations[index].state,
//                                     style: const TextStyle(
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 10,
//                                   vertical: 1), // Adjusted padding
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   // ignore: avoid_unnecessary_containers
//                                   Container(
//                                     child: const FaIcon(
//                                       FontAwesomeIcons.locationDot,
//                                       color: Colors.red,
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 10, // Decreased width
//                                   ),
//                                   TextButton(
//                                     style: TextButton.styleFrom(
//                                       backgroundColor: Colors.white,
//                                     ),
//                                     onPressed: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) => DetailsScreen(
//                                             location: locations[index],
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                     child: Row(
//                                       children: [
//                                         const FaIcon(
//                                           FontAwesomeIcons.phone,
//                                           color: TColors.primary,
//                                           size: 20,
//                                         ),
//                                         const SizedBox(
//                                           width: 15,
//                                         ),
//                                         Text(
//                                           "Book",
//                                           style: GoogleFonts.lato(
//                                             textStyle: const TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.black,
//                                                 fontSize:
//                                                     15 // Specify your desired color here
//                                                 ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         )));
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myapp/services/functions/api_functions.dart';
import 'package:myapp/widgets/custom_slider.dart';


class CustomProfile extends StatefulWidget {
  const CustomProfile({super.key});

  @override
  State<CustomProfile> createState() => _CustomProfileState();
}

class _CustomProfileState extends State<CustomProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 22,
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Image.network(
              'https://wallpapers.com/images/hd/netflix-profile-pictures-5yup5hd2i60x7ew3.jpg',
              fit: BoxFit.cover,
              height: 86,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          'Vishnulal V M',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 3, right: 3),
          child: ListTile(
            onTap: () {},
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://img.freepik.com/premium-vector/bell-button-icon-notification-bell-red-circle-template-bell-web-symbol-app-ui-logo-vector_799714-64.jpg'),
            ),
            title: Text(
              'Notifications',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          onTap: () {},
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://is2-ssl.mzstatic.com/image/thumb/Purple116/v4/16/0c/93/160c939c-4427-985e-e7fd-e4a215b00216/source/512x512bb.jpg'),
          ),
          title: Text(
            'Downloads',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        CustomSlider(title: 'Picked For You', sliderlist: topRatedList),
        CustomSlider(title: 'Popular', sliderlist: popularMoviesList)
      ],
    );
  }
}

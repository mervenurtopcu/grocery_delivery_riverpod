import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocerydelivery/product/constants/color_constants.dart';
import 'package:grocerydelivery/product/enums/index.dart';
import 'package:grocerydelivery/product/model/index.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mountainMeadow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Image.asset(
                PngConstants.avatar.toPng,
                width: 100,
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              decoration: const BoxDecoration(
                color: ColorConstants.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Divider(
                    color: ColorConstants.mountainMeadow,
                    thickness: 4,
                    indent: MediaQuery.of(context).size.width * 0.40,
                    endIndent: MediaQuery.of(context).size.width * 0.40,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Text(
                    'Lena John',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: ColorConstants.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.01,
                  ),
                  Expanded(
                    child: _profileListView(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  ListView _profileListView() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Card(
          color: ColorConstants.white,
          margin: const EdgeInsets.all(8),
          elevation: 1,
          child: ListTile(
            title: Text(profileList[index].listTitle),
            leading: profileList[index].icon,
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 10,
        );
      },
      itemCount: profileList.length,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_product_app/features/home/view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var homeViewModel = Get.put(HomeViewModel());
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.blue,
        child: ListView(
          children: [
            Container(height: 150),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Get.toNamed("/admin/manage/category");
              },
              leading: Icon(Icons.list_alt, color: Colors.white),
              title: Text(
                "List Categories",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(Icons.navigate_next_sharp, color: Colors.white),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Get.toNamed("/admin/manage/product");
              },
              leading: Icon(Icons.list, color: Colors.white),
              title: Text(
                "List Products",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Icon(Icons.navigate_next_sharp, color: Colors.white),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          // Get.toNamed("/login");
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: Text("Home", style: TextStyle(color: Colors.white)),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Username : ${homeViewModel.user.value.username}",
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text("Email : ${homeViewModel.user.value.email}"),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Phone : ${homeViewModel.user.value.phoneNumber}",
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed("/login");
                      },
                      child: Text(
                        homeViewModel.user.value.username == ""
                            ? "Login"
                            : "Logout",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

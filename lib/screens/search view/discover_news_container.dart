import 'package:flutter/material.dart';
import 'package:flutter_news_app2/screens/read%20news%20view/read_news_view.dart';

class DiscoverNewsContainer extends StatelessWidget {
  const DiscoverNewsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller1 = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(17),
      height: 295,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(1),
            height: 65,
            width: double.infinity,
            color: Colors.transparent,
            child: Row(
              children: [
                GestureDetector(
                    // onTap: () =>
                    //    Navigator.push(
                    //        context,
                    //        MaterialPageRoute(
                    //            builder: ((context) => ReadNewsView(
                    //              val: '',
                    //              image: '',
                    //            )))),
                    child: Icon(
                  Icons.menu,
                  color: Colors.black,
                )),
              ],
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          Text(
            'Discover',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'News from all over the world',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.all(6),
            width: double.infinity,
            height: 55,
            child: TextFormField(
              onFieldSubmitted: (value) {
                value = controller1.text;
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => ReadNewsView(
                //               val: value,
                //             )));
              },
              controller: controller1,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  hintMaxLines: 1,
                  hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 1,
                      //style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ))),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:otobox/src/pages/car_details_page.dart';
import 'package:otobox/src/pages/edit_image_page.dart';
import 'package:otobox/src/utils/size_config.dart';

class AddCarPage extends StatefulWidget {
  @override
  _AddCarPageState createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  final editorKey = GlobalKey<ExtendedImageEditorState>();
  ImageProvider provider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: null),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Otobox',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 30,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              children: <Widget>[
                GridItem(
                  title: 'Front View',
                  icon: IconData(
                    0xe933,
                    fontFamily: 'otobox',
                  ),
                  navigate: _pick,
                ),
                GridItem(
                  title: 'Side View',
                  icon: IconData(
                    0xe934,
                    fontFamily: 'otobox',
                  ),
                  navigate: _pick,
                ),
                GridItem(
                  title: 'Interior',
                  icon: IconData(
                    0xe933,
                    fontFamily: 'otobox',
                  ),
                  navigate: _pick,
                ),
                GridItem(
                  title: 'Engine',
                  icon: IconData(
                    0xe933,
                    fontFamily: 'otobox',
                  ),
                  navigate: _pick,
                ),
              ],
            ),
            FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 35,
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => CarDetailsPage())),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void _pick() async {
    final result = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (result != null) {
      print(result.absolute.path);
      provider = ExtendedFileImageProvider(result);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => EditCarPage(provider: provider),
        ),
      );
    }
  }
}

class GridItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function navigate;
  const GridItem({Key key, this.title, this.icon, this.navigate})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1,
        margin: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: new InkWell(
            onTap: navigate,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Center(
                    child: Icon(
                  icon,
                  size: SizeConfig.safeBlockHorizontal * 12,
                  color: Colors.black,
                )),
                SizedBox(height: SizeConfig.safeBlockVertical * 2),
                Center(
                  child: Text(title,
                      style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 5,
                          color: Color(0xFF707070))),
                )
              ],
            ),
          ),
        ));
  }
}

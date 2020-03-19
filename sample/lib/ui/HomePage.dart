import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sample/ui/presenter/PicsPresenter.dart';
import 'package:sample/ui/view/PicsView.dart';
import 'package:sample/ui/viewmodel/PicsViewModel.dart';
import 'package:sample/ui/widgets/PicCard.dart';

class HomePage extends StatefulWidget {
  final PicsPresenter presenter;

  HomePage(this.presenter);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements PicsView {
  PicsViewModel _viewModel;

  @override
  void initState() {
    super.initState();

    this.widget.presenter.view = this;
    this.widget.presenter.fetchAllPics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample'),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.bars),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(FontAwesomeIcons.plus),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
        color: Colors.grey[200],
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: _buildCards(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildCards() {
    return FutureBuilder(
      future: _viewModel.pics,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length > 0) {
            return StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return PicCard(item: snapshot.data[index]);
              },
              staggeredTileBuilder: (index) {
                return StaggeredTile.count(2, index.isEven ? 2 : 3);
              },
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
            );
          } else {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.addressCard,
                      size: 128,
                    ),
                    Divider(),
                    Text(
                      "hmm... ainda não há imagens.",
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    Divider(),
                    Text(
                      "seja o primeiro!",
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          }
        } else if (snapshot.hasError) {
          return Text(snapshot.error);
        }
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red[800]),
          ),
        );
      },
    );
  }

  @override
  void render(PicsViewModel viewModel) {
    setState(() {
      this._viewModel = viewModel;
    });
  }
}
